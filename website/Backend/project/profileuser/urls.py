from . import views
from django.urls import path 


urlpatterns = [


    # GET phone and address 
    # path('PhoneAddress/', views.GetAddressPhone.as_view(), name = 'phoneaddress'),

    # # POST and PUT phone
    # path('phone/', views.PostUpdatePhone.as_view() , name = 'phone'),

    # # POST and PUT address
    # path('address/', views.PostUpdateAddress.as_view() , name = 'address') ,


    # GET or PUT profile  
    path('profile/' ,views.GetUpdateProfile.as_view(), name = 'profile'),
    
    ##########################################################################################



]