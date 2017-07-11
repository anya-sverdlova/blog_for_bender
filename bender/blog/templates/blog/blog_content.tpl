{% if 'posts_by_author' in request.path %}
	<h3>Posts by {{ posts[0].author }}</h3>
{% endif %}

{% for post in posts %}
	<div class="posts-item">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="text-capitalize text-info">
					{% if 'blog' or 'author' in request.path %}
						<a class="text-info" href="/post/{{post.pk}}">
					{% endif %}
						{{ post.title }}
					{% if 'blog' or 'author' in request.path %}
						</a>
					{% endif %}
					{% if 'post/' in request.path %}
						<a href="/post/{{post.pk}}" class="glyphicon glyphicon-option-horizontal"></a>
					{% endif %}
				</h3>
			</div>
			<div class='panel-body _preview-content'>{{ post.content }}</div>
			<div class="panel-footer text-info">
				{% if 'author' not in request.path %}
					<p>Автор: {{ post.author }}</p
					><a class="author-link" href="/posts_by_author/{{post.author.pk}}">See all posts of this author</a>
				{% endif %}
				<p>Опубликовано: {{ post.created_at|date("d E Y")}} в {{ post.created_at|time("H:i")}}</p>
			</div>
		</div>
	</div>
{% endfor %}

