from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView


class BaseTemplatedView(TemplateView):
    template_name = 'core/base.tpl'

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(BaseTemplatedView, self).dispatch(*args, **kwargs)
