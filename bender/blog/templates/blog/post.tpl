{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}
<style>
	#blog {
		padding-top: 10px;
		font-family: Comic Sans MS;
	}
	#preview .panel h3 {
		margin: 0;
		font-size: 1.3em;
	}
	#preview .panel-heading, #preview .panel-footer {
		background: transparent;
		border:none;
	}
	#preview .panel {
		font-size: .8em;
		background-color: rgba(240, 240, 240, .3);
	}
	#preview .panel-footer {
		padding: 5px 7px;
	}
	#preview .panel:hover {
		background: rgba(240, 240, 240, 1);
	}
	#preview .panel-footer p {
		margin: 0;
	}
	#preview .panel-body {
		background: transparent;
		margin: 10px;
	}
	#preview h4 {
		margin-top: 0;
		margin-bottom: 15px;
	}
	#preview .posts-item .panel-heading h3 {
		position: relative;
		color: #31708f;
	}
	#preview .posts-item .panel-footer a.author-link {
		display: none;
	}
	#preview .glyphicon-option-horizontal {
		position: absolute;
		top: 0;
		right: 0;
	}
</style>
	<div id="blog" class="container-fluid">
		<div class="col-md-8">
			{% include 'blog/single_post.tpl' %}
			<div id="container-comment-form">
				<button data-toggle="collapse" data-target="#demo">Добавить комментарий</button>
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