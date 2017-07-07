{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}
	<div style="width: 70%; float: left;">
		{% include 'blog/blog_content.tpl' %}
	</div>
	<div style="width: 29%; float: right;">
		{% include 'blog/comment_content.tpl' %}
	</div>
{% endblock %}