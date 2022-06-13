from rest_framework import serializers
from .models import  Order , Contain



class OrderSerializer(serializers.ModelSerializer):
    order_date = serializers.DateTimeField(format="%d, %b %Y - %I:%M %p")

    
    class Meta :
        model = Order
        fields = ['id','order_date' ,'order_online','phone','address',"order_contain",'total_price']
        depth =1


class ContainSerializer(serializers.ModelSerializer):
    class Meta :
        model = Contain
        fields = ['id','dish','price','quantity']
        depth =1


class CheckoutSerializer(serializers.Serializer):
    phone = serializers.CharField(max_length=11 , required= True)
    address = serializers.CharField(max_length=200 , required= True)