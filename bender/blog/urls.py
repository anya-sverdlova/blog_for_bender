from django.conf.urls import url

from blog import views

urlpatterns = [
    url(r'^blog/$', views.BlogView.as_view(), name='blog'),
    url(r'^post/(?P<post_id>[\d]+)/$', views.PostView.as_view(), name='post'),
    url(r'^delete/(?P<id>\d+)/$', views.delete, name='delete')
]
