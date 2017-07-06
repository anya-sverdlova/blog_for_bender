# -*- coding: utf-8 -*-

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse, HttpResponseRedirect

from core import views
from blog import models

from .form import CommentForm

class BlogView(views.BaseTemplatedView):
    template_name = 'blog/blog.tpl'

    def get_context_data(self, **kwargs):
        context = super(BlogView, self).get_context_data(**kwargs)
        posts = models.Post.objects.all()

        context.update({
            "posts": posts
        })

        return context

class PostView(views.BaseTemplatedView):
    template_name = 'blog/post.tpl'

    def get_context_data(self, **kwargs):
        context = super(PostView, self).get_context_data(**kwargs)
        posts = models.Post.objects.all()
        post_id = kwargs.get('post_id')
        comments = models.Comment.objects.filter(to_post=post_id)
        # comments.delete()

        post = get_object_or_404(models.Post, pk=post_id)

        context.update({
            'post': post,
            'posts': posts,
            'form' : CommentForm(),
            'comments' : comments
        })

        return context

    def post(self, request, *args, **kwargs):
    	context = super(PostView, self).get_context_data(**kwargs)

        post = get_object_or_404(models.Post, pk=kwargs.get('post_id'))

        comment = models.Comment()
        comment.create({
            'content': request.POST.get('content'), 
            'author': request.user, 
            'to_post': post
            })
        comment.save()

        return HttpResponseRedirect(request.path)

def delete(request, id):
    comment = models.Comment.objects.filter(pk=id)
    comment.delete()
    
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))



