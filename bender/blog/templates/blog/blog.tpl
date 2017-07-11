{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block css %}
  <link href="{{ STATIC_URL }}css/bootstrap.min.css" rel="stylesheet">
  <link href="{{ STATIC_URL }}css/blog_style.css" rel="stylesheet">
{% endblock %}

{% block content %}
	<div id="blog" class="container-fluid">
		<div class="col-md-8 justify">
			<div id="container-posts">
				{% include 'blog/blog_content.tpl' %}
			</div>
			{% include 'blog/pagination.tpl' %}
		</div>
		<div class="col-md-4 justify">
			<div id="preview">
				{% if comments %}
					<h4>Комментарии:</h4>
				{% else %}
					<h4>Ни одного комментария не оставлено</h4>
				{% endif %}
				{% include 'blog/comment_content.tpl' %}
			</div>
		</div>
	</div>
	<script>
		window.onload = function() {
			makePreview('_preview-content', 8);
			makePreview('_preview-comment', 3);
		}
	</script>

{% endblock %}

