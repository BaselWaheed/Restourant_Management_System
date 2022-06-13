from . import views

from django.urls import path , include 

from django.contrib.auth import views as auth_views


urlpatterns = [

    # POST 
    path('register/' ,views.CustomerRegistrationView.as_view(), name= 'register'),

    #POST
    path('verify/',views.SignupVerify.as_view()),

    # POST 
    path('login/', views.LoginAPI.as_view(), name='login'),


    # GET 
    path('logout/', views.LogoutVIEW.as_view(), name='logout'),


    # GET 
    path('logoutall/', views.LogoutAllVIEW.as_view(), name='logoutall'),


    # POST 
    path('change-password/', views.ChangePasswordView.as_view(), name='change-password'),


    path('reset/', views.SendpasswordResetEmail.as_view(), name= 'reset'),


    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='password_reset_confirm.html'),name= 'password_reset_confirm'),

    path('reset_password_complete/', auth_views.PasswordResetCompleteView.as_view(template_name='password_reset_complete.html'),name= 'password_reset_complete'),

    path('email-verify/<uid>/<token>/', views.email , name='reset-password'), 
     
    
    #########################################################################################

]