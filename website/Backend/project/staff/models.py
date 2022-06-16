from django.db import models
from django.db.models.signals import post_save , pre_save
from Auth.models import User
from django.dispatch import receiver
from Auth.utils import Util


class Reservation(models.Model):
    user = models.ForeignKey(User, verbose_name=("name"), on_delete=models.CASCADE , null= True)
    res_date = models.DateField(("date"))
    res_time = models.TimeField(null = True)
    res_guest_count = models.IntegerField(("guest count"))
    res_is_confermed =models.BooleanField(("is confermed") ,default= False)
    def __str__(self):
        return self.user.email



class Comment(models.Model):
    user = models.ForeignKey(User, verbose_name=("name"), on_delete=models.CASCADE)
    comm_date = models.DateField(("date"), auto_now_add=True)
    comment = models.CharField(max_length=500)
    comm_is_shown = models.BooleanField(("is show"),default=False)
    comm_sentiment = models.BooleanField(("sentiment"),default=False)
    comm_is_managed = models.BooleanField(("managed"),default=False)

    def __str__(self):
        return self.user.email


@receiver(pre_save, sender=Reservation)
def checker(sender, instance, **kwargs):
    if instance.res_is_confermed == True :
        email = instance.user.email
        body = 'your reservation in\t '+ str(instance.res_date) + 'Time\t'  +str(instance.res_time) + '\nis confirmed we are welcomed to serve you'
        data = {
            'subject':'Kale Me crazy',
            'body':body,
            'to_email':email
        }
        Util.send_email(data)
        print('hello')
    