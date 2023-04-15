from django.urls import path
from . import views

app_name = 'app'
# todo urlパラメーターで「admin」「accounts」に送れない。。。
urlpatterns = [
    path('output/', views.output_test, name='output_test'),
    path('delete/', views.delete_test, name='delete_test'),
    path('import_data/', views.import_data, name='import_data'),
    path('export_data/', views.export_data, name='export_data'),
    path('test_function/', views.test_function, name='test_function'),
]
