from django.contrib import admin
from app.models import TargetMaster2


class TargetMaster2Admin(admin.ModelAdmin):
    list_display = ('target', 'target_name', 'lost_flag')
    list_filter = ['target', 'target_name', 'lost_flag']
    search_fields = ['target', 'target_name', 'lost_flag']


admin.site.register(TargetMaster2, TargetMaster2Admin)

