from django.urls import path
from . import views

app_name = 'app'
# todo urlパラメーターで「admin」「accounts」に送れない。。。
urlpatterns = [
    path('database_migration/', views.database_migration, name='database_migration'),
    path('database_migration/database_export1/', views.database_export1, name='database_export1'),
    path('database_migration/database_export2/', views.database_export2, name='database_export2'),
    path('database_migration/database_import/', views.database_import, name='database_import'),

    path('output/', views.output_test, name='output_test'),
    path('delete/', views.delete_test, name='delete_test'),
    path('import_data/', views.import_data, name='import_data'),
    path('export_data/', views.export_data, name='export_data'),
    path('test_function/', views.test_function, name='test_function'),

    path('home/', views.home, name='home'),
]
