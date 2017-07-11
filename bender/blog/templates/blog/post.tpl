{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block css %}
  <link href="{{ STATIC_URL }}css/bootstrap.min.css" rel="stylesheet">
  <link href="{{ STATIC_URL }}css/blog_style.css" rel="stylesheet">
{% endblock %}

{% block content %}
	<div id="blog" class="container-fluid">
		<div class="col-md-8">
			{% include 'blog/single_post.tpl' %}
			<div id="container-comment-form">
				<button data-toggle="collapse" data-target="#demo" class="btn btn-default btn-block active">Добавить комментарий</button>
				<div id="demo" class="collapse">
					{% include 'blog/comments_form.tpl' %}
				</div>
			</div>
			{% if comments %}
				<h4>Комментарии:</h4>
			{% else %}
				<h4>Ни одного комментария не оставлено</h4>
			{% endif %}
			{% include 'blog/comment_content.tpl' %}
		</div>
		<div class="col-md-4">
			<div id='preview'>
				<h4 class="text-info text-uppercase">Последние записи</h4>
				{% include 'blog/blog_content.tpl' %}
			</div>
		</div>
	</div>
	<script>
		window.onload = function() {
			makePreview('_preview-content', 7);
		}
	</script>
{% endblock %}