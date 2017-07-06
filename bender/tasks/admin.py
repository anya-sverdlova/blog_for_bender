# -*- coding: utf-8 -*-

from django.contrib import admin

from tasks import models


class TestCaseInline(admin.TabularInline):
    model = models.TestCase
    extra = 1


@admin.register(models.Task)
class TaskAdmin(admin.ModelAdmin):
    inlines = [
        TestCaseInline,
    ]


@admin.register(models.Solution)
class SolutionAdmin(admin.ModelAdmin):
    pass


@admin.register(models.TestCase)
class TestCase(admin.ModelAdmin):
    pass
