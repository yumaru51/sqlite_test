from django.contrib import admin
from .models import TargetMaster

# Register your models here.


class TargetMasterAdmin(admin.ModelAdmin):
    list_display = ('target', 'target_name', 'lost_flag')
    list_filter = ['target', 'target_name', 'lost_flag']
    search_fields = ['target', 'target_name', 'lost_flag']


admin.site.register(TargetMaster, TargetMasterAdmin)
