from django.urls import path
from . import views

app_name = 'app'
# todo urlパラメーターで「admin」「accounts」に送れない。。。
urlpatterns = [
    path('output/', views.output_test, name='output_test'),
    path('input/', views.input_test, name='input_test'),
    path('delete/', views.delete_test, name='delete_test'),
]
