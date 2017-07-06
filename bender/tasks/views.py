# -*- coding: utf-8 -*-

import ujson
from django.shortcuts import get_object_or_404
from django.http import HttpResponse

from core import views
from django.db import models as global_models
from tasks import models


class IndexView(views.BaseTemplatedView):
    template_name = 'tasks/index.tpl'

    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        tasks = models.Task.objects.all()

        context.update({
            'tasks': tasks
        })

        return context


class TaskView(views.BaseTemplatedView):
    template_name = 'tasks/task.tpl'

    def get_context_data(self, **kwargs):
        context = super(TaskView, self).get_context_data(**kwargs)
        task_id = kwargs.get('task_id')

        task = get_object_or_404(models.Task, pk=task_id)

        context.update({
            'task': task
        })

        return context

    def post(self, request, *args, **kwargs):
        data = request.body
        username = request.user.username
        task_id = kwargs.get('task_id')

        return HttpResponse(
            ujson.dumps(
                {
                    'data': data,
                    'user': username,
                    'kwargs': kwargs
                }  
            ),
            status=200,
            content_type="application/json"
        )
