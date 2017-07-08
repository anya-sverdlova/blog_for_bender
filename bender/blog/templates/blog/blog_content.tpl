{% if 'posts_by_author' in request.path %}
	<h3>Posts by {{ posts[0].author }}</h3>
{% endif %}
<style>
	.content-container {
		border: 1px solid #e5e5e5;
		border-radius: 4px;
		padding: 0;
		margin-bottom: 15px;
		font-family: Comic Sans MS;
	}
	.content-container a.header {
		display: block;
		padding: 15px;
		font-size: 1.4em;
		background: #d5d5d5;
		border-bottom: 1px solid #e5e5e5;
	}
	.content-container a.header:hover {
		text-decoration: none;
		cursor: pointer;
	}
	.content-container .content {
		display: block;
		box-sizing: border-box;
		margin: 15px;
	}
	.content-container .content-footer {
		border-top: 1px solid #e5e5e5;
		background: #f0f0f0;
		padding: 5px 10px 10px;
	}
	.content-container * {
		box-sizing: border-box;
		margin: 0;
		padding: 0;
	}
	.content-container .content-footer * {
		display: inline-block;
		vertical-align: middle;
		width: 33%;
		min-width: 220px;
		font-size: .9em;
	}
</style>
{% for post in posts %}
	<div class="content-container col-md-11 justify">
		<a class="header text-uppercase text-info" href="/post/{{post.pk}}">{{ post.title }}</a></td>
		<p class='content preview-content'>{{ post.content }}</p>
		<div class="content-footer col-md-12 text-info">
			{% if 'blog' in request.path %}
				<p>Автор: {{ post.author }}</p
				><a href="/posts_by_author/{{post.author.pk}}">See all posts of this author</a>
			{% endif %}
			<p>Опубликовано: {{ post.created_at|date("d E Y")}} в {{ post.created_at|time("H:i")}}</p>
		</div>
	</div>
{% endfor %}

