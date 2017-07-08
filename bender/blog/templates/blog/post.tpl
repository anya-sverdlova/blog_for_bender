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
		<div id='preview'>
			{% include 'blog/blog_content.tpl' %}
			<script>
				window.onload = function() {
					var previews = document.getElementsByClassName('preview-content');

					for ( var i = 0; i < previews.length; i++ ) {
						$clamp(previews[i], {clamp: 3});
					}
				}
			</script>
		</div>
		{% include 'blog/comment_content.tpl' %}
	</div>
	
{% endblock %}