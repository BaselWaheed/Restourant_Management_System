from django.shortcuts import render
from rest_framework import generics
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny, IsAuthenticated
from Auth.models import Customer , Code
from .serializer import CustomerRegistrationSerializer, CustomerSerializer , PasswordChangeSerializer , LoginSerializer , SendPAsswordSerializer , UserPasswordResetSerializer, UserSerializer
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from django.contrib.auth import login as LOGIN
from authentication.views import TokenAuthentication
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import  smart_str
from django.utils.http import urlsafe_base64_decode 
from .models import User




class CustomerRegistrationView(generics.GenericAPIView):  # signup 
    authentication_classes = ()
    permission_classes = (AllowAny,)
    serializer_class =CustomerRegistrationSerializer
    def post(self , request , *args , **kwargs):
        serializer = self.get_serializer(data =request.data)
        data = {}
        serializer.is_valid(raise_exception= True)
        user =serializer.save()
        data.update(serializer.data)
        token =Token.objects.create(user=user).key
        # data['token'] = token 
        return Response({ 'status' : True ,'message' :'account created successfully', "data" :data },status=status.HTTP_200_OK)

class SignupVerify(APIView):
    authentication_classes = ()
    permission_classes = (AllowAny,)
    def post(self, request, format=None):
        data = {}
        code = request.data.get('code')
        try :
            number=Code.objects.get(code=code)
            user= User.objects.get(email=number.user)
            user.is_verify = True
            user.save()
            userserializer = UserSerializer(user)
            data.update(userserializer.data)
            # token =Token.objects.create(user=user).key
            # data['token'] = token 
            try :
                customer = Customer.objects.get(user=user)
                customerserializer = CustomerSerializer(customer)
                data.update(customerserializer)
                number.delete()
                return Response({'status':True,'message' :'account have been verified','data':data},status=status.HTTP_200_OK)
            except :
                number.delete()
                return Response({'status':True,'message' :'account have been verified','data':data},status=status.HTTP_200_OK)
        except Code.DoesNotExist:
            return Response({'status':False , 'message':"Code is incorrect" , 'data':data},status=status.HTTP_400_BAD_REQUEST)





class LoginAPI(generics.GenericAPIView):   
    authentication_classes = ()
    permission_classes = (AllowAny,)
    serializer_class = LoginSerializer
    def post(self , request , *args , **kwargs):
        data = {}
        serializer = self.get_serializer(data =request.data)
        serializer.is_valid(raise_exception= True)
        user = serializer.validated_data['user']
        Token.objects.get(user_id=user.id).delete()
        token = Token.objects.create(user=user)
        LOGIN(request, user)
        profile = UserSerializer(user)
        data.update(profile.data)
        data['token'] = token.key 
        customer = Customer.objects.get(user=user)
        customerserializer = CustomerSerializer(customer)
        data.update(customerserializer.data)
        return Response({'status':True,'messege':'You are logged in', 'data' : data }, status=status.HTTP_200_OK)



class LogoutVIEW(APIView):
    authentication_classes = (TokenAuthentication,)  # log out 
    permission_classes = (IsAuthenticated,)
    def get(self, request, format=None):   
        tokens = Token.objects.filter(user=request.user)   
        for token in tokens:
            token.delete()
        return Response({'status' : True,'success': 'User logged out.'}, status=status.HTTP_200_OK)



class LogoutAllVIEW(APIView):  # log out all
    permission_classes = (IsAuthenticated,)
    authentication_classes = (TokenAuthentication)
    def get(self, request, format=None):
        tokens = Token.objects.all()
        for token in tokens:
            token.delete()
        return Response({'status' : True,'success': 'User logged out.'}, status=status.HTTP_200_OK)




class ChangePasswordView(APIView):
    authentication_classes = (TokenAuthentication,)   #change password
    permission_classes = (IsAuthenticated,)
    serializer_class = PasswordChangeSerializer
    def post(self, request, format=None):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():   
            user = request.user
            old_password = request.data.get('old_password')
            new_password = request.data.get('new_password')
            confermation_password = request.data.get('confermation_password')
            if not user.check_password(old_password):
                return Response({'status' : False,'message': 'password in correct'}, status=status.HTTP_200_OK)
            if confermation_password != new_password :
                return Response({'status' : False,'message': 'password bot match'}, status=status.HTTP_200_OK)
            user.set_password(new_password)
            user.save()
            return Response({'status' : True,'success': 'Password changed'}, status=status.HTTP_200_OK)
        return Response({'status' : False,'messege': 'Password incorrect'}, status=status.HTTP_400_BAD_REQUEST)


class SendpasswordResetEmail(generics.GenericAPIView):
    authentication_classes = ()
    permission_classes = (AllowAny,)
    serializer_class = SendPAsswordSerializer
    def post(self,request,format=None):
        serializer = self.get_serializer(data =request.data)
        if serializer.is_valid():
            return Response({'status': True,'messege' : 'check your email'},status=status.HTTP_200_OK)
        return Response({'status' : False,'messege': 'Email in correct or missing please try again '}, status=status.HTTP_400_BAD_REQUEST)


class UserPasswordResetView(APIView):
    # dah lw hy3mlo al page fe mobile aw website
    authentication_classes = ()
    permission_classes = (AllowAny,)
    def post(self, request, uid, token, format=None):
        serializer = UserPasswordResetSerializer(data=request.data, context={'uid':uid, 'token':token})
        serializer.is_valid(raise_exception=True)
        return Response({'msg':'Password Reset Successfully'}, status=status.HTTP_200_OK)



def email(request, *args, **kwargs):
    token = kwargs['token']
    uid = kwargs['uid']
    id = smart_str(urlsafe_base64_decode(uid))
    user = User.objects.get(id=id)
    print(user)
    if user.is_verify == True :
        return render(request,'email_failed.html')
    if not PasswordResetTokenGenerator().check_token(user,token):
        return render(request,'email_failed.html')
    if request.method== 'POST':
        code1 =request.POST.get('otp1')
        code2 =request.POST.get('otp2')
        code3 =request.POST.get('otp3')
        code4 =request.POST.get('otp4')
        code5 =request.POST.get('otp5')
        code6 =request.POST.get('otp6')
        code = code1+code2+code3+code4+code5 + code6
        try :
            code = Code.objects.get(code=code)
            user = User.objects.get(email=code.user)
            user.is_verify = True
            user.save()
            code.delete()
            return render(request,'email_verified.html')
        except Code.DoesNotExist:
            return render(request,'error404.html')
    return render(request,'email-verify.html')

