from django.urls import path 
from . import views
urlpatterns = [

    # GET categories
    path('category/', views.CategoryVIEW.as_view() , name = 'category'),


    # products and category
    path('categoryApi/',views.CategoryMobileAndWebViewAPI.as_view(), name = 'categoryApi'),
    # GET  DISHS
    path('meet/', views.MeetDishVIEW.as_view() , name = 'meet'),
    path('vegetables/', views.VegetablesDishVIEW.as_view() , name = 'vegetables'),
    path('drinks/', views.DrinksDishVIEW.as_view() , name = 'drinks'),
    path('chicken/', views.ChickenDishVIEW.as_view() , name = 'chicken'),
   
####################################################################################

    # GET DETAILS OF DISH 
    path('details/',views.DishDetailsView.as_view() , name = 'details') ,


    # GET HOME PAGE
    path('home/',views.HomeDishView.as_view(), name ='home'),

    path('search/',views.SearchAPI.as_view(), name ='search'),

    # path('categoryWebApi/',views.CategoryWebViewAPI.as_view(), name = 'categoryWebApi'),


 

    
]