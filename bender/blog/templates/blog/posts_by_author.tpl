{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}
	
<div id="blog" class="container-fluid">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		{% include 'blog/blog_content.tpl' %}
		{% include 'blog/pagination.tpl' %}
	</div>
	<div class="col-md-1"></div>
</div>

{% endblock %}