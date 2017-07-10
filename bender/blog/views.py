# -*- coding: utf-8 -*-

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse, HttpResponseRedirect, request
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from datetime import datetime

from core import views
from blog import models

from .form import CommentForm

class BlogView(views.BaseTemplatedView):
    template_name = 'blog/blog.tpl'
    pagination_step = 3

    def get_context_data(self, **kwargs):
        context = super(BlogView, self).get_context_data(**kwargs)
        comments = models.Comment.objects.all().order_by('-pk')[:5]
        posts_list = models.Post.objects.all().order_by('-pk')

        data = set_pagination({
            'self': self,
            'posts_list': posts_list,
        });
       
        context.update({
            "posts": data.get('posts'),
            "comments": comments,
            'page': data.get('page'),
        })

        return context

class PostView(views.BaseTemplatedView):
    template_name = 'blog/post.tpl'

    def get_context_data(self, **kwargs):
        context = super(PostView, self).get_context_data(**kwargs)
        post_id = kwargs.get('post_id')
        comments = models.Comment.objects.filter(to_post=post_id).order_by('-pk')
        posts = models.Post.objects.all().order_by('-pk')[:5]

        post = get_object_or_404(models.Post, pk=post_id)

        context.update({
            'post': post,
            'posts': posts,
            'form' : CommentForm(),
            'comments' : comments
        })

        return context

class PostsByAuthorView(views.BaseTemplatedView):
    template_name = 'blog/posts_by_author.tpl'
    pagination_step = 3

    def get_context_data(self, **kwargs):
        context = super(PostsByAuthorView, self).get_context_data(**kwargs)
        author_id = kwargs.get('id')
        posts_list = models.Post.objects.filter(author=author_id).order_by('-pk')

        data = set_pagination({
            'self': self,
            'posts_list': posts_list,
        });

        context.update({    
            "posts": data.get('posts'),
            "page": data.get('page')
        })

        return context

def set_pagination(kwargs):
    posts_list = kwargs.get('posts_list')
    page = kwargs.get('self').request.GET.get('page')

    paginator = Paginator(posts_list, kwargs.get('self').pagination_step)

    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)

    return {'posts': posts, 'page': page}
    

def add_comment(request, id):
    post = get_object_or_404(models.Post, pk=id)

    comment = models.Comment()
    comment.create({
        'content': request.POST.get('content'), 
        'author': request.user, 
        'to_post': post
        })
    comment.save()

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def delete(request, id):
    comment = models.Comment.objects.filter(pk=id)
    comment.delete()

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def change_comment(request, id):
    comment = models.Comment.objects.filter(pk=id)
    comment.update(
        content = request.POST.get('content'),
        is_corrected = True,
        corrected_at = datetime.now()
    )

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))    
