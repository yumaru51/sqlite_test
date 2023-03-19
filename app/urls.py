from django.urls import path
from . import views

app_name = 'app'
# todo urlパラメーターで「admin」「accounts」に送れない。。。
urlpatterns = [
    path('output/', views.output_test, name='output_test'),
    path('delete/', views.delete_test, name='delete_test'),
    path('excel_import/', views.excel_import, name='excel_import'),
    path('excel_import2/', views.excel_import2, name='excel_import2'),
    path('excel_export/', views.excel_export, name='excel_export'),
]
