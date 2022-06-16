from . import views
from django.urls import path 


urlpatterns = [

    # POST reservation and GET
    path('reservation/', views.ReservationAPI.as_view(),name='reservation'),

    
    path('comment/', views.CommentAPI.as_view(),name='comment'),

    path('Reviews/', views.GetReviewsAPI.as_view(),name='Reviews'),    

    path('managecomment/' ,views.managecomment , name = 'managecomment'),



    path('report/',views.render_pdf_view,name='report'),

]