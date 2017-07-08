{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}
	<div class="container-fluid">
		<div class="col-md-8 justify">
			{% include 'blog/blog_content.tpl' %}
			{% include 'blog/pagination.tpl' %}
		</div>
		<div class="col-md-4 justify">
			{% include 'blog/comment_content.tpl' %}
			<script>
				window.onload = function() {
					var previews = document.getElementsByClassName('preview-content');

					for ( var i = 0; i < previews.length; i++ ) {
						$clamp(previews[i], {clamp: 8});
					}
				}
			</script>
		</div>
	</div>
{% endblock %}
