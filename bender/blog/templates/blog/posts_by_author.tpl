{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}
	
{% include 'blog/blog_content.tpl' %}
{% include 'blog/pagination.tpl' %}
	
{% endblock %}