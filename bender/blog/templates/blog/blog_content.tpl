{% if 'posts_by_author' in request.path %}
	<h3>Posts by {{ posts[0].author }}</h3>
{% endif %}
<style>
	.panel-body {
		box-sizing: border-box;
		padding: 0;
		margin: 15px;
	}
	#blog .panel-footer>* {
		display: inline-block;
		vertical-align: top;
		width: 33%;
		min-width: 220px;
		font-size: .9em;
	}
</style>
{% for post in posts %}
	<div class="posts-item">
		<div class="panel panel-default">
			<div class="panel-heading text-capitalize">
				<a href="/post/{{post.pk}}"><h3 class="text-info" >{{ post.title }}</h3></a>
			</div>
			<div class='panel-body _preview-content'>{{ post.content }}</div>
			<div class="panel-footer text-info">
				{% if 'author' not in request.path %}
					<p>Автор: {{ post.author }}</p
					><a href="/posts_by_author/{{post.author.pk}}">See all posts of this author</a>
				{% endif %}
				<p>Опубликовано: {{ post.created_at|date("d E Y")}} в {{ post.created_at|time("H:i")}}</p>
			</div>
		</div>
	</div>
{% endfor %}

