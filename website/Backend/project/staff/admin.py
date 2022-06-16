from django.contrib import admin
from .models import Comment , Reservation
# Register your models here.

class CommentAdmin(admin.ModelAdmin):
    list_display = ["user" , 'comm_date','comm_sentiment' , 'comm_is_shown',"comm_is_managed"]


admin.site.register(Comment,CommentAdmin)


class ReservationAdmin(admin.ModelAdmin):
    list_display = ["user" , 'res_date','res_time' , 'res_is_confermed']



admin.site.register(Reservation,ReservationAdmin)
