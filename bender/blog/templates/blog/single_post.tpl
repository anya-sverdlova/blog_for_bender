<style>
	#container-single-post .glyphicon {
		position: absolute;
		top: 15px;
		right: 30px;
		font-size: 1.2em;
	}
	#container-single-post .panel-footer>p {
		display: inline-block;
		vertical-align: middle;
		width: 50%;
		min-width: 330px;
		font-size: .9em;
	}
</style>
<div id="container-single-post" class="panel panel-default">
	<div class="panel-heading">
		<h3 class="text-info text-capitalize" style="margin: 10px 0;">{{ post.title }}</h3>
		{% if user.id == post.author.id %}
			<a class="glyphicon glyphicon-pencil text-info" href="/admin/blog/post/{{ post.id }}/change/"></a>
		{% endif %}
	</div>
	<p class="panel-body">{{ post.content }}</p>
	<div class="panel-footer text-info">
		<p>Автор: {{ post.author }}</p
		><p class="text-right">Опубликовано: {{ post.created_at|date("d E Y")}} в {{ post.created_at|time("H:i")}}</p>
	</div>
</div>