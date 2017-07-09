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
		font-size: 1.5em;
	}
	#preview .panel {
		font-size: .8em;
	}
	#preview .panel-footer {
		padding: 5px 7px;
	}
	#preview .panel-footer p {
		margin: 0;
	}
	#preview .panel-body {
		margin: 10px;
	}
	#preview h4 {
		margin-top: 0;
		margin-bottom: 15px;
	}
	#preview .posts-item .panel-footer a {
		display: none;
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
			<h4>Комментарии:</h4>
			{% include 'blog/comment_content.tpl' %}
		</div>
		<div class="col-md-4">
			<div id='preview'>
				<h4 class="text-info text-uppercase">Последние записи</h4>
				{% include 'blog/blog_content.tpl' %}
				<script>
					window.onload = function() {
						var previews = document.getElementsByClassName('_preview-content');

						for ( var i = 0; i < previews.length; i++ ) {
							$clamp(previews[i], {clamp: 3});
						}
					}
				</script>
			</div>
		</div>
	</div>
{% endblock %}