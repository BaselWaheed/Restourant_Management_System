
from django.contrib import admin
from django.urls import path , include
from django.conf.urls.static import static
from django.conf import settings

admin.site.site_header = 'Kale Me Crazy'
admin.site.site_title = 'Restourant'
admin.site.index_title = 'Kale Me Crazy'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('Auth.urls')) ,
    path('info/', include('profileuser.urls')) ,
    path('product/', include('product.urls')) ,
    path('favourite/', include('favourite.urls')) ,
    path('order/', include('order.urls')) ,
    path('staff/', include('staff.urls')) ,

    
]+ static(settings.MEDIA_URL , document_root = settings.MEDIA_ROOT)
