from django.db import models
import datetime


# 対象マスタ
class TargetMaster2(models.Model):
    target = models.CharField('対象', max_length=20, primary_key=True)
    target_name = models.CharField('対象名', max_length=20, blank=True, null=True)
    lost_flag = models.IntegerField('無効FL', blank=True, null=True)

    class Meta:
        db_table = 'app_m_target2'

