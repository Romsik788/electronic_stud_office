from django.urls import path
from django.urls.conf import include

from main import views

urlpatterns = [
    path('signin', views.index),
    path('signup', views.signup),
    path('main', views.main_page),
    path('marks', views.marks),
    path('signout', views.signout),
    path('activate', views.activate),
    path('', views.redirect_to_main),
]
