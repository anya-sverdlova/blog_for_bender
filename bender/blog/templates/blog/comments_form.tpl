<div style="border: 1px solid green; margin-top: 20px; background: white;">
	<form method="post" action="/add_comment/{{ post.id }}/">
	    {% csrf_token %}
	    {% for fields in form %}
	    	{{ fields }}
	    {% endfor %} 
	    <button>Отправить комментарий</button>
	</form>
		
</div>
