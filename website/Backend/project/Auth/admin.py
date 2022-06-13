from django.contrib import admin
from .models import Code, User , Customer 
# Register your models here.




class UserAdmin(admin.ModelAdmin):
    list_display = ["id","email" , 'first_name' , 'is_customer','is_staff','is_verify' ]


admin.site.register(User,UserAdmin)


# class CustomerAdmin(admin.ModelAdmin):
#     list_display = ["id" , 'address' , 'user']



admin.site.register(Customer)



class CodeAdmin(admin.ModelAdmin):
    list_display = ['user','code' ]

admin.site.register(Code,CodeAdmin)