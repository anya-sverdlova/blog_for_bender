# -*- coding: utf-8 -*-

from django.contrib import admin

from blog import models

admin.site.register(models.Post)