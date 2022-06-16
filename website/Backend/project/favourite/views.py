from rest_framework import status
from rest_framework.permissions import IsAuthenticated   
from rest_framework.views import APIView
from product.serializer import DishSerializer 
from product.models import  Dish, FavouriteDish 
from rest_framework.response import Response
from django.shortcuts import  get_object_or_404
from authentication.views import TokenAuthentication


class GetAddOrDeleteFavouriteView(APIView):
    authentication_classes = (TokenAuthentication,)
    permission_classes = [IsAuthenticated,]
    def get(self,request):
        data = {}
        query = Dish.objects.filter(favourite_dish=self.request.user)
        serializers = DishSerializer(query, many=True)
        if serializers is None :
            return Response({'status':False , 'message' : 'No favourite found' },status=status.HTTP_200_OK)  
        else :
            data['product']= serializers.data
            return Response({'status':True , 'message' : 'null' , 'data': data },status=status.HTTP_200_OK)

    def post(self,request):
        dish = Dish.objects.get(id=request.data['id'])
        if request.user  not in dish.favourite_dish.all():
            FavouriteDish.objects.create(user=self.request.user, product=dish ,is_favourite=True) 
            return Response({'status': True,'message': 'dish added to favourite'}, status=status.HTTP_200_OK)
        elif  request.user in dish.favourite_dish.all():
            dish.favourite_dish.remove(request.user)
            return Response({'status': True,'message': 'dish removed from favourite'}, status=status.HTTP_200_OK)
        else :
            return Response({'status': False,'message': 'Error data (id)' }, status=status.HTTP_400_BAD_REQUEST)


    def delete(self, request):
        dish = get_object_or_404(Dish, pk=request.data.get('id')) 
        if request.user in dish.favourite_dish.all():
            dish.favourite_dish.remove(request.user)
            return Response({'status': True,'message': 'dish removed from favourite'}, status=status.HTTP_200_OK)
        return Response({'status': False,'message': 'dish not available in favourite'}, status=status.HTTP_400_BAD_REQUEST)
