# Generated by Django 2.1.15 on 2023-04-21 06:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quality_change_management', '0002_auto_20230420_1753'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='request',
            name='education_management_system_id',
        ),
        migrations.AddField(
            model_name='request',
            name='education_check',
            field=models.BooleanField(default=False, verbose_name='教育チェック'),
        ),
    ]