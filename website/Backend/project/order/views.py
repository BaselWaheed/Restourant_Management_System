from .models import Order ,Contain 
from product.models import Dish
from rest_framework.response import Response
from .serializer import  CheckoutSerializer, OrderSerializer , ContainSerializer
from rest_framework import status
from django.shortcuts import  get_object_or_404
from rest_framework.views import APIView
from django.utils import timezone
from authentication.views import TokenAuthentication 
from django.db.models import Sum



class CartPostGetVIEW(APIView):
    authentication_classes = (TokenAuthentication,)
    def post(self,request,**kwargs):
        dish = get_object_or_404(Dish, pk=request.data.get('id')) 
        order = Order.objects.all().filter(user=self.request.user,is_finished = False)
        data = {'cart_item':[]}
        if order:
            old_order = Order.objects.get(user=self.request.user,is_finished = False)
            
            if dish in old_order.order_contain.all():
                old_dish = Contain.objects.get(order=old_order,dish=dish)
                old_dish.quantity +=1
                old_dish.price = int(old_dish.quantity) * int(old_dish.dish.dish_price)
                old_dish.save()
                return Response({'status':True , "message":'dish added to cart '},status=status.HTTP_200_OK)
            else:
                new_contain = Contain.objects.create(dish=dish,order=old_order, quantity=1 ,price=dish.dish_price, in_cart =True)
                cartSerializer = ContainSerializer(new_contain)
                data['cart_item'].append(cartSerializer.data)               
                return Response({'status':True , "message":'dish added to cart ','data' :data},status=status.HTTP_200_OK)
        else :
            new_order = Order(user = self.request.user)
            new_order.order_date = timezone.now()
            new_order.is_finished = False
            new_order.save()
            new_contain = Contain.objects.create(dish=dish,order=new_order,quantity=1,price=dish.dish_price ,in_cart =True)
            cartSerializer = ContainSerializer(new_contain)
            data['cart_item'].append(cartSerializer.data)
            return Response({'status':True , 'data' :data},status=status.HTTP_200_OK)
    def get(self,request):
        data = {'cart_item':[]}
        try:
            order = Order.objects.get(user=self.request.user,is_finished = False)
            cart = Contain.objects.filter(order=order,in_cart=True)
            cartSerializer = ContainSerializer(cart,many=True)
            sub_total = Contain.objects.filter(order=order).aggregate(sub_total=Sum('price'))
            order.save()
            if order :
                if cart :
                    for product in cartSerializer.data:
                        data['cart_item'].append(product)
                    data.update(sub_total)
                    data['delivery'] = 30
                    data['total_price']= sub_total['sub_total'] + 30
                    return Response({'status':True , "message":'null', 'data':data},status=status.HTTP_200_OK)
                else :
                    return Response({'status':True , "message":'null', 'data':data},status=status.HTTP_200_OK)
                    
            else :
                return Response({'status':True , "message":'null', 'data':data},status=status.HTTP_200_OK)
        except Order.DoesNotExist:
            return Response({'status':True , "message":'null', 'data':data},status=status.HTTP_200_OK)
    def put(self,request, *args , **kwargs):
        try :
            data = {'cart_item':[]} 
            quantity = request.data.get('quantity')
            if quantity :
                cart_item = Contain.objects.get(id=request.data.get('id'))
                cart_item.quantity = quantity
                old_order = Order.objects.get(user=self.request.user,is_finished=False)
                cart_item.price = int(quantity) * float(cart_item.dish.dish_price)
                cart_item.save()
                sub_total = Contain.objects.filter(order=old_order ,in_cart=True).aggregate(sub_total=Sum('price'))
                old_order.total_price = sub_total['sub_total'] + 30
                old_order.save()
                cartSerializer = ContainSerializer(cart_item)
                data['cart_item'].append(cartSerializer.data)
                data.update(sub_total)           
                data['delivery'] = 30
                data['total_price']= old_order.total_price 
                return Response({'status': True,'message' :'Updated data Successfuly','data':data} ,status=status.HTTP_202_ACCEPTED)
            else :
                return Response({'status': False,'message' :'YOU MUST ENTER QUANTITY','data':[]} ,status=status.HTTP_404_NOT_FOUND)
        except Contain.DoesNotExist:
            return Response({ 'status' : False ,'message' :'you must put data to change '},status=status.HTTP_404_NOT_FOUND)

    def delete(self , request):
        try:
            cart_item = Contain.objects.get(id=request.data.get('id'))
        except Contain.DoesNotExist:
            return Response({ 'status' : False ,'message' :'you must put data to delete '},status=status.HTTP_404_NOT_FOUND)
        cart_item.delete()
        return Response({'status': True,'message' :'item removed from cart'} ,status=status.HTTP_200_OK)


class CheckoutOnlineAPI(APIView):
    authentication_classes = (TokenAuthentication,)
    def post(self,request,**kwargs):
        data = {"My_order":[]}
        serializer = CheckoutSerializer(data=request.data)
        if serializer.is_valid():
            try:
                order= Order.objects.get(user=self.request.user,is_finished=False)
                cart = Contain.objects.filter(order=order,in_cart=True)
                if cart:
                    order.phone = request.data.get('phone')
                    order.address = request.data.get('address')
                    order.is_finished = True
                    sub_total = Contain.objects.filter(order=order,in_cart=True).aggregate(sub_total=Sum('price'))
                    order.total_price = sub_total['sub_total'] + 30
                    order.order_online = True
                    order.save()
                    for i in cart :
                        item = Contain.objects.get(pk=i.id)
                        item.in_cart= False 
                        item.save()
                    orderserializer = OrderSerializer(order)
                    data['My_order'].append(orderserializer.data)
                    return Response({'status':True,'message':'your order','data':data},status=status.HTTP_200_OK)
                else :
                    return Response({'status':False , "message":"no item in order",'data':data},status=status.HTTP_200_OK)
            except Order.DoesNotExist:
                return Response({'status': False ,'message': 'order not found','data':data},status=status.HTTP_400_BAD_REQUEST)
        else :
            return Response({'status': False ,'message': 'phone and address are in correct','data':data},status=status.HTTP_400_BAD_REQUEST)



class CheckoutInRestourant(APIView):
    authentication_classes = (TokenAuthentication,)
    def get(self,request,**kwargs):
        data = {"My_order":[]}
        try:
            order= Order.objects.get(user=self.request.user,is_finished=False)
            cart = Contain.objects.filter(order=order,in_cart=True)
            if cart:
                order.is_finished = True
                total_price = Contain.objects.filter(order=order,in_cart=True).aggregate(total_price=Sum('price'))
                order.total_price = total_price['total_price']
                order.order_online = False
                order.save()
                for i in cart :
                    item = Contain.objects.get(pk=i.id)
                    item.in_cart= False 
                    item.save()
                orderserializer = OrderSerializer(order)
                data['My_order'].append(orderserializer.data)
                return Response({'status':True,'message':'your order','data':data},status=status.HTTP_200_OK)
            else :
                return Response({'status':False , "message":"no item in order",'data':data},status=status.HTTP_200_OK)
        except Order.DoesNotExist:
            return Response({'status': False ,'message': 'order not found','data':data},status=status.HTTP_400_BAD_REQUEST)




      

class MyOrderAPI(APIView):
    authentication_classes = (TokenAuthentication,)
    def get(self,request):
        data = {"My_order":[]}
        order= Order.objects.filter(user=self.request.user,is_finished=True)
        if order:
            serializer = OrderSerializer(order,many=True)
            for item in serializer.data:
                data['My_order'].append(item)
            return Response({"status":True,"message":"Your order",'data':data},status=status.HTTP_200_OK)
        else:
            return Response({"status":False,"message":"No order you have",'data':data},status=status.HTTP_200_OK)


class OrderDetailsAPI(APIView):
    authentication_classes = (TokenAuthentication,)
    def post(self,request,**kwargs):
        data = {"My_orders":[]}
        try :
            order = Order.objects.get(pk= request.data.get("order_id"))
            contain = Contain.objects.filter(order=order , in_cart=False)
            serializer = ContainSerializer(contain , many=True)
            for item in serializer.data:
                data['My_orders'].append(item)
            return Response({"status":True,"message":"Your order Details",'data':data},status=status.HTTP_200_OK)
        except Order.DoesNotExist:
            return Response({"status":False,"message":"No data",'data':data},status=status.HTTP_400_BAD_REQUEST)

