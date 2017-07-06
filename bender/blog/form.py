# -*- coding: utf-8 -*-

from django import forms
from django.forms import ModelForm, Textarea
from .models import Comment
from blog import models
from django.conf import settings


class CommentForm(ModelForm):
    class Meta:
        model = Comment
        fields = ('content',)
        widgets = {
            'content': Textarea(attrs={'rows': 10, 'placeholder': "Оставьте комментарий"}),
        }
