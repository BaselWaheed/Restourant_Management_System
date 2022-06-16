from django.db import models
from Auth.models import User
from product.models import Dish
import uuid
# Create your models here.
class Order(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, unique= True ,editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    phone = models.CharField(max_length=11 , null= True, blank=True)
    address = models.CharField(max_length=200 , null= True , blank=True)
    order_date = models.DateTimeField()
    order_contain = models.ManyToManyField(Dish, through='Contain')
    order_online = models.BooleanField(default= False)
    is_finished = models.BooleanField(default= False)
    total_price =  models.FloatField(default= 0 , null = True , blank = True)

    def __str__(self):
        return 'User :' + self.user.email  +  ', order id' + str(self.id)



class Contain(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, unique= True ,editable=False)
    dish = models.ForeignKey(Dish, on_delete=models.CASCADE)
    order = models.ForeignKey(Order, on_delete=models.CASCADE ,related_name='order_items')
    price = models.DecimalField(max_digits=6, decimal_places=2 , null=True , blank=True)
    quantity = models.IntegerField(null= True , blank=True)
    in_cart = models.BooleanField(default= False)

    def __str__(self):
        return self.order.user.email

