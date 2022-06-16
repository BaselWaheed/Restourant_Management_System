from rest_framework import serializers
from .models import User , Customer , Code , generate_code
from django.contrib.auth import authenticate
from django.utils.encoding import smart_str , force_bytes ,DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode , urlsafe_base64_encode
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from Auth.utils import Util
from django.contrib.sites.shortcuts import get_current_site

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['first_name','last_name','username','email' ,'phone','address']

    def update(self, instance, validated_data):
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.username = validated_data.get('username', instance.username)
        instance.phone = validated_data.get('phone', instance.phone)
        instance.address = validated_data.get('address', instance.address)
        instance.save()
        return instance


class CustomerSerializer(serializers.ModelSerializer):
    class Meta :
        model = Customer
        fields = ['birthdate' , 'is_male']

    def update(self, instance, validated_data):
        instance.birthdate = validated_data.get('birthdate', instance.birthdate)
        instance.is_male = validated_data.get('is_male', instance.is_male)
        instance.save()
        return instance


class CustomerRegistrationSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required= True)
    username = serializers.CharField(required= True)
    phone = serializers.CharField(required= True)
    address = serializers.CharField(required= True)
    birthdate= serializers.DateField(required= True)
    is_male = serializers.BooleanField(required= True)
    class Meta:
        model = User
        fields = ['id','first_name','last_name','username', 'email', 'password' ,'phone','address','birthdate' ,'is_male' ]
        read_only_fields = ['id']
        extra_kwargs={
            'password' :{'write_only':True}
        }
    def save(self , **kwargs):
        user =User(
            first_name =self.validated_data['first_name'],
            last_name =self.validated_data['last_name'],
            username =self.validated_data['username'],
            email =self.validated_data['email'],
            phone =self.validated_data['phone'],
            address =self.validated_data['address'],
           
        )
        customer = Customer(
            user=user,
            is_male=self.validated_data['is_male'],
            birthdate=self.validated_data['birthdate'],
        )
        print(self.validated_data['birthdate'])       
        if User.objects.filter(email=self.validated_data['email']).exists():
            raise serializers.ValidationError({
                'status' : False ,
                'message' :('email already exist')
                })
        if User.objects.filter(username=self.validated_data['username']).exists():
            raise serializers.ValidationError({
                'status' : False ,
                'message' :('username already taken')
                })
        if User.objects.filter(phone=self.validated_data['phone']).exists():
            raise serializers.ValidationError({
                'status' : False ,
                'message' :('phone already exist')
                })   
        password =self.validated_data['password']
        user.set_password(password)
        user.is_customer = True
        user.save()
        number = Code(user=user)
        number.code = generate_code()
        number.save()
        customer.save()
        request = self.context['request']
        site = get_current_site(request).domain
        uid = urlsafe_base64_encode(force_bytes(user.id))
        token = PasswordResetTokenGenerator().make_token(user)
        link = 'http://'+site+'/api/email-verify/'+ uid + '/'+token+ '/'
        body = 'Click Following Link to verify Email\n'+ link+'\n'+'This code to verify Email \t'+str(number.code)
        print(body)
        data = {
            'subject':'Email verification',
            'body':body,
            'to_email': user.email
        }
        Util.send_email(data)      
        return user



class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField(style={'input_type': 'password'})

    def validate(self, data , **kwargs):
        email = data.get('email')
        password = data.get('password')

        if email and password:
            user = authenticate(email=email, password=password)
            if user:
                if not user.is_active:
                    raise serializers.ValidationError({
                        'status' : False,
                        'message' :('y'),
                        })
                if not user.is_verify:
                    try :
                        old_code = Code.objects.get(user=user).delete()
                        new_code = Code.objects.create(user=user , code =generate_code())
                    except:
                        new_code = Code.objects.create(user=user , code =generate_code())
                    site = get_current_site(self.context['request']).domain
                    uid = urlsafe_base64_encode(force_bytes(user.id))
                    token = PasswordResetTokenGenerator().make_token(user)
                    link = 'http://'+site+'/api/email-verify/'+ uid + '/'+token+ '/'
                    body = 'Click Following Link to verify Email\n'+ link+'\n'+'This code to verify Email \t'+str(new_code.code)
                    mail = {
                        'subject':'Email verification',
                        'body':body,
                        'to_email': user.email
                    }
                    Util.send_email(mail)
                    raise serializers.ValidationError({
                        'status' : False ,
                        'message' :('check your mail to verify account ')
                        })   
                        
            else:
                raise serializers.ValidationError({
                    'status' : False,
                    'message' :('n'),
                    })
        else:
            raise serializers.ValidationError({'status' : False,'message' :'Email or password incorrect'})

        data['user'] = user
        return data




class PasswordChangeSerializer(serializers.Serializer):
    old_password = serializers.CharField(max_length=128)
    new_password = serializers.CharField(max_length=128)
    confermation_password = serializers.CharField(max_length=128)





class SendPAsswordSerializer(serializers.Serializer):
    email = serializers.EmailField(max_length=255)
    class Meta:
        fields=['email']
    def validate(self, attrs):
        email = attrs.get('email')
        if User.objects.filter(email=email).exists():
            user = User.objects.get(email=email)
            uid = urlsafe_base64_encode(force_bytes(user.id))
            token = PasswordResetTokenGenerator().make_token(user)
            request = self.context['request']
            site = get_current_site(request).domain
            link = 'http://'+site+'/api/reset/'+ uid + '/'+token+ '/'
            body = 'Click Following Link to Reset Your Password '+link
            data = {
                'subject':'Reset Your Password',
                'body':body,
                'to_email':user.email
            }
            Util.send_email(data)
            return attrs
        else :
            raise serializers.ValidationError(
                {'status' : False,
                'message' :'Email incorrect'
            })






class UserPasswordResetSerializer(serializers.Serializer):
  password = serializers.CharField(max_length=255, style={'input_type':'password'}, write_only=True)
  password2 = serializers.CharField(max_length=255, style={'input_type':'password'}, write_only=True)
  class Meta:
    fields = ['password', 'password2']
  def validate(self, attrs):
    try:
        password = attrs.get('password')
        password2 = attrs.get('password2')
        uid = self.context.get('uid')
        token = self.context.get('token')
        if password != password2:
            raise serializers.ValidationError("Password and Confirm Password doesn't match")
        id = smart_str(urlsafe_base64_decode(uid))
        user = User.objects.get(id=id)
        if not PasswordResetTokenGenerator().check_token(user, token):
            raise serializers.ValidationError('Token is not Valid or Expired')
        user.set_password(password)
        user.save()
        return attrs
    except DjangoUnicodeDecodeError as identifier:
        PasswordResetTokenGenerator().check_token(user, token)
        raise serializers.ValidationError('Token is not Valid or Expired')