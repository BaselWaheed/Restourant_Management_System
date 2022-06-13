from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.base_user import BaseUserManager
import binascii
import os
from django.conf import settings
from django.utils import timezone



def generate_code():
    return binascii.hexlify(os.urandom(3)).decode('utf-8')

class CustomUserManager(BaseUserManager):
    def create_user(self, email, password, **extra_fields):
        if not email:
            raise ValueError(('The Email must be set'))
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)
        if extra_fields.get('is_staff') is not True:
            raise ValueError(('Superuser must have is_staff=True.'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(('Superuser must have is_superuser=True.'))
        if extra_fields.get('is_active') is not True:
            raise ValueError(('Superuser must have is_active=True.'))        
        return self.create_user(email, password, **extra_fields)



class User(AbstractUser):
    username = models.CharField(max_length=25 , unique= False , null =True)
    email = models.EmailField(max_length=80 , unique= True)
    is_customer = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    first_name = models.CharField(max_length=15,verbose_name=('first name'))
    last_name = models.CharField(max_length=15,verbose_name=('last name'))
    phone = models.CharField(max_length=11,null=True,unique=False)
    address = models.CharField(max_length=200,null=True)
    is_verify = models.BooleanField(default=False,blank=True)
    date_joined = models.DateTimeField(default=timezone.now)
    USERNAME_FIELD = 'email' 
    REQUIRED_FIELDS = ['username','phone']
    def __str__(self):
        return self.email

class Customer(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    birthdate= models.DateField(null=True,verbose_name=('birth data'))
    is_male = models.BooleanField(null=True , default=True)
    def __str__(self):
        return self.user.email

class Staff(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    position = models.CharField(max_length=20,blank=True,null= True)
    def __str__(self):
        return self.user.email


 

class Code(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    code =models.CharField(max_length=40, primary_key=True)
    def __str__(self):
        return self.code


