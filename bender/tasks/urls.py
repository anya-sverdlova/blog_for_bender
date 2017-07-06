from django.conf.urls import url

from tasks import views

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^(?P<task_id>[\d]+)/$', views.TaskView.as_view(), name='task'),
    url(r'^(?P<task_id>[\d]+)/review/$', views.TaskView.as_view(), name='review'),
]
