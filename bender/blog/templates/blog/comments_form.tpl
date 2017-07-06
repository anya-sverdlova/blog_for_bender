<div style="border: 1px solid green; margin-top: 20px; background: white;">
	<form method="post" action="">
	    {% csrf_token %}
	    {% for fields in form %}
	    	{{ fields }}
	    {% endfor %} 
	    <button>Отправить комментарий</button>
	</form>
		
</div>
