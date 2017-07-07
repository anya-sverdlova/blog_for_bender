{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}
<style type="text/css">
	.comment-changed {
		display: none;
	}
	.comment-changed.active {
		display: block;
	}
</style>
	<div style="background: pink; width: 60%; float: left">
		<a href="/admin/blog/post/{{ post.id }}/change/">CORRECT</a>
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
				<div style="border: 1px solid green" class="comment-item">
					{% if user.id == comment.author.id %}
						<button onclick="changeComment(this)">CHANGE</button>
						<a href="/delete/{{comment.id}}" >DELETE</a>
					{% endif %}
					<div class="comment-changed active">{{ comment.content }}</div>
					<div class="comment-changed">
						<form method="post" action="/change_comment/{{comment.id}}/">
							{%csrf_token%}
							<textarea name="content">{{ comment.content }}</textarea>
							<button>SAVE CHANGES</button>
						</form>
					</div>
					<div>{{ comment.id }}</div>
					<div>{{ comment.created_at }}</div>
					<div>{{ comment.to_post.pk }}: {{ comment.to_post }}</div>
				</div>
			{% endfor %}
		{% endif %}
		<script type="text/javascript">
			function changeComment(element) {
				var set = element.parentNode.getElementsByClassName('comment-changed');

				for ( var i = 0; i < set.length; i++ ) {
					set[i].classList.toggle('active');
				}
			}
		</script>
	</div>
{% endblock %}