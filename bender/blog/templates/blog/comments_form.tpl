	<form method="post" action="/add_comment/{{ post.id }}/">
	    {% csrf_token %}
	    {% for fields in form %}
	    	{{ fields }}
	    {% endfor %} 
	    <button>Отправить комментарий</button>
	</form>