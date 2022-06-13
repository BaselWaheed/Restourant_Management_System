from django.urls import path 
from . import views 


urlpatterns = [


    # POST OR DELETE FAVOURITE , GET
    path('favouriteDish/', views.GetAddOrDeleteFavouriteView.as_view() , name = 'favourite'),


]