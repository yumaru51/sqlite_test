from django.contrib import admin
from app.models import TargetMaster, PageMaster, ActionMaster, StepMaster, StepPageEntryMaster, StepDisplayPage


class TargetMasterAdmin(admin.ModelAdmin):
    list_display = ('target', 'target_name', 'lost_flag')
    list_filter = ['target', 'target_name', 'lost_flag']
    search_fields = ['target', 'target_name', 'lost_flag']


admin.site.register(TargetMaster, TargetMasterAdmin)


class PageMasterAdmin(admin.ModelAdmin):
    list_display = ('page', 'page_name', 'lost_flag')
    list_filter = ['page', 'page_name', 'lost_flag']
    search_fields = ['page', 'page_name', 'lost_flag']


admin.site.register(PageMaster, PageMasterAdmin)


class ActionMasterAdmin(admin.ModelAdmin):
    list_display = ('action', 'action_name', 'action_class', 'action_authority', 'progress_transition', 'lost_flag')
    list_filter = ['action', 'action_name', 'action_class', 'action_authority', 'progress_transition', 'lost_flag']
    search_fields = ['action', 'action_name', 'action_class', 'action_authority', 'progress_transition', 'lost_flag']


admin.site.register(ActionMaster, ActionMasterAdmin)


class StepMasterAdmin(admin.ModelAdmin):
    list_display = ('step', 'step_name', 'hidden_flag', 'lost_flag')
    list_filter = ['step', 'step_name', 'hidden_flag', 'lost_flag']
    search_fields = ['step', 'step_name', 'hidden_flag', 'lost_flag']


admin.site.register(StepMaster, StepMasterAdmin)


class StepPageEntryMasterAdmin(admin.ModelAdmin):
    list_display = ('step', 'page', 'target', 'lost_flag')
    list_filter = ['step', 'page', 'target', 'lost_flag']
    search_fields = ['step', 'page', 'target', 'lost_flag']


admin.site.register(StepPageEntryMaster, StepPageEntryMasterAdmin)


class StepDisplayPageAdmin(admin.ModelAdmin):
    list_display = ('step', 'page_no', 'page', 'default_page', 'lost_flag')
    list_filter = ['step', 'page_no', 'page', 'default_page', 'lost_flag']
    search_fields = ['step', 'page_no', 'page', 'default_page', 'lost_flag']


admin.site.register(StepDisplayPage, StepDisplayPageAdmin)
