from django.db import models
import uuid
from Auth.models import User




class Category(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, unique= True ,editable=False)
    cat_name = models.CharField(max_length=50)
    def __str__(self):
        return self.cat_name




class Dish(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, unique= True ,editable=False)
    dish_name = models.CharField(max_length=50)
    dish_price = models.DecimalField(max_digits=6, decimal_places=2)
    dish_discription = models.TextField()
    dish_category = models.ForeignKey(Category, on_delete=models.CASCADE)
    dish_image = models.URLField()
    dish_url = models.ImageField(upload_to='ProductImage')
    is_active = models.BooleanField(default= False)
    favourite_dish = models.ManyToManyField(User, through='FavouriteDish')
    def __str__(self):
        return self.dish_name



class FavouriteDish(models.Model):
    product = models.ForeignKey(Dish, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    is_favourite = models.BooleanField(default =False)
    def __str__(self):
        return self.user.email      