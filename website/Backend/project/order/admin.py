from django.contrib import admin
from .models import Contain , Order




class ContainAdmin(admin.ModelAdmin):
    list_display = ['id' , 'dish', 'quantity' , 'in_cart']




admin.site.register(Contain,ContainAdmin)
admin.site.register(Order)
