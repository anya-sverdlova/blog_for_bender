<style type="text/css">
	._comment-changed {
		height: 0;
    	overflow: hidden;
		transition: height .3s;
	}
	._comment-changed._active {
		height: auto;
		transition: display .3s;
	}
	#container-comments .glyphicon {
		cursor: pointer;
		color: #9c9c9c;
	}
	#container-comments .glyphicon:hover {
		text-decoration: underline;
		color: #333;
	}
	#container-comments {
		margin-top: 20px;
		padding: 0;
	}
	#container-comments>.comment-item {
		position: relative;
		padding: 0;
		margin-bottom: 25px;
		border-radius: 4px 4px 0 0;
	}
	#container-comments .panel-body {
		word-wrap: break-word;
	}
	#container-comments .panel-footer p {
		margin-bottom: 0;
		font-size: 1em;
	}
	#container-comments .panel-footer div {
		font-size: .9em;
	}
	#container-comments .panel-footer {
		background: #fff;
	}
	#container-comments .panel-footer .text-info {
		color: #474747;
	}
	#container-comment-form {
		margin-bottom: 20px;
	}
	#container-comments .form-group {
		margin-bottom: 0;
	}
	#container-comments .icon-outer {
		float: right;
		overflow: hidden;
		margin-left: 10px;
	}
	#container-comments .form-group .icon-outer .glyphicon-ok {
		padding: 0;
	}
	#container-comments .form-group .icon-outer {
		float: right;
		width: 4%;
		margin-left: 1%;
		text-align: right; 
	}
	#container-comments textarea {
		width: 95%;
		float: left;
		resize: none;
	}
	#container-comments button {
		border: none;
		background: transparent;
	}
</style>
<div id="container-comments" class="container-fluid ">
	{% for comment in comments %}
		<div class="comment-item panel panel-default col-md-12" id={{comment.pk}}>
			{% if 'blog' in request.path %}
				<div class="panel-heading">
					<p>Комментарий к посту</p> "<a href="/post/{{comment.to_post.pk}}#{{comment.pk}}" class="text-capitalize" >{{ comment.to_post.title }}</a>"
				</div>
			{% endif %}
			<div class="panel-body" id="#parent{{comment.id}}" class="collapse">
				{% if 'post' in request.path and user.id == comment.author.id %}
					<div class='icon-outer _active _comment-changed'>
						<span class="glyphicon glyphicon-pencil" onclick="showChangeComment(this)"></span>
						<a class="glyphicon glyphicon-trash" href="/delete/{{comment.id}}"></a>
					</div>
				{% endif %}
				<div class="_comment-changed _active _preview-comment">{{ comment.content }}</div>
				<div class="_comment-changed">
					<form class="form-group" method="post" action="/change_comment/{{comment.id}}/">
						{%csrf_token%}
						<textarea class="form-control" rows="10" name="content">{{ comment.content }}</textarea>
						<div class="icon-outer">
							<button class="glyphicon glyphicon-ok"></button>
							<div class="glyphicon glyphicon-remove" onclick="showChangeComment(this)"></div>
						</div>
					</form>
				</div>
			</div>
			<div class="panel-footer col-sm-12">
				<p class="text-info col-sm-6">Комментарий от {{ comment.author }}</p
				><div class="text-info text-right col-sm-6">
				<div>Добавлен {{ comment.created_at|date("d E Y") }} в {{ comment.created_at|time("H:i") }}</div>
					{% if comment.is_corrected %}
						<div>Откорректирован {{ comment.corrected_at|date("d E Y") }} в {{ comment.corrected_at|time("H:i") }}</div>
					{% endif %}
				</div>
			</div>
		</div>
	{% endfor %}
	<script type="text/javascript">
		function showChangeComment(element) {
			var parent;
			while ((element = element.parentElement) && !element.classList.contains('panel-body'));
    			parent = element
			var set = parent.parentNode.getElementsByClassName('_comment-changed');

			for ( var i = 0; i < set.length; i++ ) {
				set[i].classList.toggle('_active');
			}
		}
	</script>
</div>