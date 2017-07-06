{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}
	<div style="background: pink; width: 60%; float: left">
		<p style="border: 1px solid red; padding: 10px;">{{ post.title }}</p>
		<p style="border: 1px solid red; padding: 10px;">{{ post.content }}</p>
		<p style="border: 1px solid red; padding: 10px;">{{ post.author }}</p>
		<p style="border: 1px solid red; padding: 10px;">{{ post.created_at }}</p>
		{% include 'blog/comments_form.tpl' %}
	</div>
	<div class="preview" style="width: 35%; float: right; font-size: .8em;">
		{% include 'blog/blog_content.tpl' %}
		{% if comments %}
			{% for comment in comments %}
				<div>{{ comment.content }}</div>
				<div>{{ comment.author }}</div>
				<div>{{ comment.created_at }}</div>
				<div>{{ comment.to_post.pk }}: {{ comment.to_post }}</div>
			{% endfor %}
		{% endif %}
	</div>
{% endblock %}