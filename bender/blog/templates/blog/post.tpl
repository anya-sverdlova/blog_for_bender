{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}

	<div style="background: pink; width: 60%; float: left">
		{% include 'blog/single_post.tpl' %}
		<div style="border: 1px solid green; margin-top: 20px; background: white;">
			{% include 'blog/comments_form.tpl' %}
		</div>
	</div>
	<div style="width: 35%; float: right; font-size: .8em;">
		{% include 'blog/blog_content.tpl' %}
		{% include 'blog/comment_content.tpl' %}
	</div>
	
{% endblock %}