# -*- coding: utf-8 -*-

from django.conf import settings
from django.db import models
from django.utils.translation import ugettext as _

from tasks import constants


class Task(models.Model):
    title = models.CharField(
        max_length=100,
        null=False,
        blank=False,
        verbose_name=_(u'Название')
    )
    description = models.CharField(
        max_length=255,
        null=False,
        blank=False,
        verbose_name=_(u'Описание')
    )
    input_example = models.CharField(
        max_length=100,
        null=True,
        blank=True,
        verbose_name=_(u'Пример ввода')
    )
    output_example = models.CharField(
        max_length=100,
        null=False,
        blank=False,
        verbose_name=_(u'Пример вывода')
    )

    class Meta:
        verbose_name = _(u'Задача')
        verbose_name_plural = _(u'Задачи')

    def __unicode__(self):
        return self.title


class Solution(models.Model):
    author = models.ForeignKey(
        to=settings.AUTH_USER_MODEL,
        null=False,
        blank=False,
        related_name='solutions',
        verbose_name=_(u'Автор')
    )
    task = models.ForeignKey(
        to='Task',
        null=False,
        blank=False,
        related_name='solutions',
        verbose_name=_(u'Задача')
    )
    status = models.CharField(
        max_length=100,
        choices=constants.STATUSES,
        null=False,
        blank=False,
        verbose_name=_(u'Статус')
    )
    content = models.TextField(
        null=False,
        blank=False,
        verbose_name=_(u'Код решения')
    )
    message = models.TextField(
        null=True,
        blank=True,
        verbose_name=_(u'Сообщение об ошибке')
    )
    created_at = models.DateTimeField(
        auto_now_add=True,
        verbose_name=_(u'Опубликовано')
    )

    class Meta:
        verbose_name = _(u'Решение')
        verbose_name_plural = _(u'Решения')
        ordering = ['-created_at']

    def __unicode__(self):
        return '{}: {}'.format(self.author.username, self.task.title)


class TestCase(models.Model):
    task = models.ForeignKey(
        to='Task',
        null=False,
        blank=False,
        related_name='tests',
        verbose_name=_(u'Задача')
    )
    given_input = models.CharField(
        max_length=100,
        null=True,
        blank=True,
        verbose_name=_(u'Входящие данные')
    )
    expected_output = models.CharField(
        max_length=100,
        null=False,
        blank=False,
        verbose_name=_(u'Ожидаемый вывод')
    )

    class Meta:
        verbose_name = _(u'Тест')
        verbose_name_plural = _(u'Тесты')
