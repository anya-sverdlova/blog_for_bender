{% if 'posts_by_author' in request.path %}
	<h3>Posts by {{ posts[0].author }}</h3>
{% endif %}
{% for post in posts %}
	<a style="background: green; color: white" href="/post/{{post.pk}}">{{ post.title }}</a></td>
	<p class='preview-content' style="background: #e5e5e5;">{{ post.content }}</p>
	{% if 'blog' in request.path %}
		<p style="background: #d5d5d5;">{{ post.author }}</p>
		<a href="/posts_by_author/{{post.author.pk}}">See all posts of this author</a>
	{% endif %}
	<p style="background: #fafafa;">{{ post.created_at }}</p>
{% endfor %}

