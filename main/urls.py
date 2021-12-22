from django.urls import path

from main import views


handler404 = views.CodeError404
urlpatterns = [
    path('signin', views.index),
    path('signup', views.signup),
    path('main', views.main_page),
    path('marks', views.marks),
    path('signout', views.signout),
    path('activate', views.activate),
    path('subjects', views.subjects),
    path('', views.redirect_to_main),
]
