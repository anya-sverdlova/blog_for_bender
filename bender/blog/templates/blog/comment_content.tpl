<style type="text/css">
	._comment-changed {
		height: 0;
		overflow: hidden;
		opacity: 0;
		transition: opacity .1s;
	}
	._comment-changed._active {
		height: auto;
		opacity: 1;
		transition: opacity .1s;
	}
	#container-comments .glyphicon {
		cursor: pointer;
	}
	#container-comments .glyphicon-pencil:hover {
		text-decoration: underline;
		color: #245269;
	}
	#container-comments {
		margin-top: 20px;
		padding: 0;
	}
	#container-comments>.comment-item {
		padding: 0;
		border-radius: 4px 4px 0 0;
		margin-bottom: 25px;
	}
	#container-comments .panel-heading * {
		display: inline-block;
		vertical-align: middle;
		width: 50%;
		min-width: 330px;
	}
	#container-comments .panel-heading p {
		margin-bottom: 0;
		font-size: 1em;
	}
	#container-comments .panel-heading div {
		font-size: .8em;
	}
	#container-comment-form {
		margin-bottom: 20px;
	}
</style>
<div id="container-comments" class="container-fluid ">
	{% for comment in comments %}
		<div class="comment-item panel panel-default">
			{% if 'post' in request.path and user.id == comment.author.id %}
				<span class="glyphicon glyphicon-pencil text-info" onclick="changeComment(this)"></span>
				<a class="glyphicon glyphicon-trash text-info" href="/delete/{{comment.id}}"></a>
			{% endif %}
			<div class="panel-heading">
				{% if comment.is_corrected %}
					<div>it was corrected</div>
					{{ comment.corrected_at|date("d E Y") }} в {{ comment.corrected_at|time("H:i") }}
				{% endif %}
				<p class="text-info">Комментарий от {{ comment.author }}</p
				><div class="text-info text-right">Добавлен {{ comment.created_at|date("d E Y") }} в {{ comment.created_at|time("H:i") }}</div>
			</div>
			<div class="panel-body">
				<div class="_comment-changed _active">{{ comment.content }}</div>
				<div class="_comment-changed">
					<form method="post" action="/change_comment/{{comment.id}}/">
						{%csrf_token%}
						<textarea name="content">{{ comment.content }}</textarea>
						<button>SAVE CHANGES</button>
					</form>
				</div>
			</div>
			{% if 'blog' in request.path %} 
				<a href="/post/{{comment.to_post.pk}}/"></a>
			{% endif %}
		</div>
	{% endfor %}
	<script type="text/javascript">
		function changeComment(element) {
			var set = element.parentNode.getElementsByClassName('_comment-changed');

			for ( var i = 0; i < set.length; i++ ) {
				set[i].classList.toggle('_active');
			}
		}
	</script>
</div>