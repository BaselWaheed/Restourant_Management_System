# from .models import Address , Phone  
from Auth.models import Customer , User
from rest_framework.response import Response
from Auth.serializer import UserSerializer , CustomerSerializer
from rest_framework.permissions import IsAuthenticated   
from rest_framework.views import APIView
from rest_framework import status
from authentication.views import TokenAuthentication




class GetUpdateProfile(APIView):   # profile of user GET and PUT
    permission_classes = [IsAuthenticated,]
    authentication_classes = (TokenAuthentication,)
    def put(self,request, *args , **kwargs):
        data={}
        try: 
            user = self.request.user
            customer = Customer.objects.get(user=self.request.user)
        except User.DoesNotExist:
            return Response({ 'status' : False ,'message' :'Token invalid'},status=status.HTTP_404_NOT_FOUND)
        userSerializer = UserSerializer(user,data=request.data)
        customerSerializer = CustomerSerializer(customer,data=request.data)
        if userSerializer.is_valid() and customerSerializer.is_valid():
            userSerializer.save()
            customerSerializer.save()
            data.update(userSerializer.data)
            data.update(customerSerializer.data)
            return Response({'status': True,'message' :'Updated data Successfuly','data':data} ,status=status.HTTP_202_ACCEPTED)
        else :
            return Response({ 'status' : False ,'message' :'Error data '},status=status.HTTP_404_NOT_FOUND)
    def get(self, request, format=None):
        data={}
        try:
            user = self.request.user
            customer = Customer.objects.get(user=self.request.user)      
        except User.DoesNotExist:
            return Response({ 'status' : False ,'message' :'Token invalid'},status=status.HTTP_404_NOT_FOUND)
        userSerializer = UserSerializer(user)
        customerSerializer = CustomerSerializer(customer)
        data.update(userSerializer.data)
        data.update(customerSerializer.data)
        return Response({'status': True,'data':data} ,status=status.HTTP_200_OK)