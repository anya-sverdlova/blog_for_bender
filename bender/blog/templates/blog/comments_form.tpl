	<form method="post" action="/add_comment/{{ post.id }}/">
	    {% csrf_token %}
	    {% for fields in form %}
	    	{{ fields }}
	    {% endfor %} 
	    <button class="btn btn-block btn-default active">Отправить комментарий</button>
	</form>