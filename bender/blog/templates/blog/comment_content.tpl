<style type="text/css">
	.comment-changed {
		display: none;
	}
	.comment-changed.active {
		display: block;
	}
</style>
{% for comment in comments %}
	<div style="border: 1px solid green" class="comment-item">
		{% if 'post' in request.path %}
			{% if user.id == comment.author.id %}
				<button onclick="changeComment(this)">CHANGE</button>
				<a href="/delete/{{comment.id}}" >DELETE</a>
			{% endif %}
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
		{% if 'blog' in request.path %} <a href="/post/{{comment.to_post.pk}}"> {% else %} <div> {% endif %}
			{{ comment.to_post.pk }}: {{ comment.to_post }}
		{% if 'blog' in request.path %} </a> {% else %} </div> {% endif %}
	</div>
{% endfor %}
<script type="text/javascript">
	function changeComment(element) {
		var set = element.parentNode.getElementsByClassName('comment-changed');

		for ( var i = 0; i < set.length; i++ ) {
			set[i].classList.toggle('active');
		}
	}
</script>