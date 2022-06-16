from django.contrib import admin
from .models import Category , Dish , FavouriteDish
# Register your models here.

class CategoryAdmin(admin.ModelAdmin):
    list_display = ['id','cat_name' ]
admin.site.register(Category,CategoryAdmin)

class DishAdmin(admin.ModelAdmin):
    list_display = ['dish_name' , 'dish_price', 'dish_category' , 'is_active']
    list_filter = ['dish_category']
    search_fields = ['dish_name']

admin.site.register(Dish,DishAdmin)

admin.site.register(FavouriteDish)