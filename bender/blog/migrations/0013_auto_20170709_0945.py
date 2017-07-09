# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-09 09:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0012_auto_20170708_1751'),
    ]

    operations = [
        migrations.AddField(
            model_name='comment',
            name='corrected_at',
            field=models.DateTimeField(blank=True, null=True, verbose_name='\u041e\u0442\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u043e'),
        ),
        migrations.AddField(
            model_name='comment',
            name='is_correct',
            field=models.NullBooleanField(),
        ),
        migrations.AlterField(
            model_name='comment',
            name='created_at',
            field=models.DateTimeField(verbose_name='\u041e\u043f\u0443\u0431\u043b\u0438\u043a\u043e\u0432\u0430\u043d\u043e'),
        ),
    ]
