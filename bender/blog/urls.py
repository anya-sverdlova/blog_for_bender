from django.conf.urls import url

from blog import views

urlpatterns = [
    url(r'^blog/$', views.BlogView.as_view(), name='blog'),
    url(r'^post/(?P<post_id>[\d]+)/$', views.PostView.as_view(), name='post'),
    url(r'^delete/(?P<id>\d+)/$', views.delete, name='delete'),
    url(r'^add_comment/(?P<id>\d+)/$', views.add_comment, name='add_comment'),
    url(r'^change_comment/(?P<id>\d+)/$', views.change_comment, name='change_comment'),
    url(r'^posts_by_author/(?P<id>\d+)/$', views.PostsByAuthorView.as_view(), name='posts_by_author'),
]
