{% for post in posts %}
	<div style="border: 1px solid red">
	<a style="background: green; color: white" href="/post/{{post.pk}}">{{ post.title }}</a></td>
		<p style="background: yellow">{{ post.content }}</p>
		<p style="background: #d5d5d5;">{{ post.author }}</p>
		<p style="background: #fafafa;">{{ post.created_at }}</p>
	</div>
{% endfor %}