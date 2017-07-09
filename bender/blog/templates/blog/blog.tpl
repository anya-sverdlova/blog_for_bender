{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}
<style>
	#blog {
		font-family: Comic Sans MS;
		padding-top: 10px;
	}
	#preview #container-comments {
		margin-top: 0; 
	}
	#preview h4 {
		margin-top: 0;
		color: #31708f;
	}
</style>
	<div id="blog" class="container-fluid">
		<div class="col-md-8 justify">
			<div id="container-posts">
				{% include 'blog/blog_content.tpl' %}
			</div>
			{% include 'blog/pagination.tpl' %}
			<script>
				window.onload = function() {
					var previews = document.getElementsByClassName('_preview-content');

					for ( var i = 0; i < previews.length; i++ ) {
						$clamp(previews[i], {clamp: 8});
					}
				}
			</script>
		</div>
		<div class="col-md-4 justify">
			<div id="preview">
				<h4>Комментарии:</h4>
				{% include 'blog/comment_content.tpl' %}
			</div>
		</div>
	</div>
{% endblock %}
