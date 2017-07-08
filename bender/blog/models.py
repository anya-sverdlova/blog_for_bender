# -*- coding: utf-8 -*-

from django.conf import settings
from django.db import models
from django.utils.translation import ugettext as _

class Post(models.Model):
    title = models.CharField(
        max_length=100,
        null=False,
        blank=False,
        verbose_name=_(u'Название')
    )
    content = models.TextField(
        null=False,
        blank=False,
        verbose_name=_(u'Содержание')
    )
    author = models.ForeignKey(
        to=settings.AUTH_USER_MODEL,
        null=False,
        blank=False,
        verbose_name=_(u'Автор')
    )
    created_at = models.DateTimeField(
        auto_now_add=True,
        null=False,
        blank=False,
        verbose_name=_(u'Опубликовано')
    )
    
    class Meta:
        verbose_name = _(u'Заметка')
        verbose_name_plural = _(u'Заметки')

    def __unicode__(self):
        return self.title

class Comment(models.Model):
    to_post = models.ForeignKey(
        to=Post,
        null=True,
        blank=True
    )
    author = models.ForeignKey(
        to=settings.AUTH_USER_MODEL,
        null=True,
        blank=True,
        verbose_name=_(u'Автор')
    )
    created_at = models.DateTimeField(
        auto_now_add=True,
        null=False,
        blank=False,
        verbose_name=_(u'Опубликовано')
    )
    content = models.TextField(
        null=False,
        blank=False,
    )
    def create(self, args):
        self.to_post = args['to_post']
        self.author = args['author']
        self.content = args['content']

