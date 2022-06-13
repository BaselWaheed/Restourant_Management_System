from rest_framework import serializers
from order.models import Order
from .models import Category , Dish, FavouriteDish



class CategorySerializer(serializers.ModelSerializer):
    class Meta :
        model = Category
        fields = ['id','cat_name']


class DishSerializer(serializers.ModelSerializer):
    is_favourite = serializers.SerializerMethodField()
    in_cart = serializers.SerializerMethodField()

    def get_is_favourite(self,obj):
        try:
            dish = FavouriteDish.objects.filter(user=self.context['request'].user).filter(product_id=obj.id)
            if dish:
                return True
            else :
                return False
        except:
            return False 

    def get_in_cart(self,obj):
        try :
            dish = Order.objects.filter(user=self.context['request'].user).filter(order_contain=obj.id)
            if dish :
                return True
            else :
                return False
        except:
            return False

    class Meta :
        model = Dish
        fields = ['id','dish_name','dish_price','dish_image','dish_url','dish_discription', 'dish_category','is_active','is_favourite','in_cart']

