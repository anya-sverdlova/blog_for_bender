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
        comments = models.Comment.objects.all()[:5]
        posts = models.Post.objects.all()

        context.update({
            "posts": posts,
            "comments": comments
        })

        return context

class PostView(views.BaseTemplatedView):
    template_name = 'blog/post.tpl'

    def get_context_data(self, **kwargs):
        context = super(PostView, self).get_context_data(**kwargs)
        posts = models.Post.objects.all()
        post_id = kwargs.get('post_id')
        comments = models.Comment.objects.filter(to_post=post_id).order_by('pk')

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

    def get_context_data(self, **kwargs):
        context = super(PostsByAuthorView, self).get_context_data(**kwargs)
        author_id = kwargs.get('id')
        posts = models.Post.objects.filter(author=author_id)

        context.update({    
            "posts": posts,
        })

        return context

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
    comment.update(content = request.POST.get('content'))

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


