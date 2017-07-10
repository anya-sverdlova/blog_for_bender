{% extends 'core/base.tpl' %}

{% block title %}Бложик{% endblock %}

{% block content %}
<style>
	#blog {
		font-family: Comic Sans MS;
		padding-top: 10px;
	}
	#preview #container-comments {
		margin-top: 0; 
	}
	#preview h4 {
		margin-top: 0;
		color: #31708f;
	}
	#preview #container-comments .panel-footer {
		font-size: .7em;
	}
	#preview #container-comments .panel-footer>div.text-info {
		font-size: 1em;
	}
	#preview #container-comments .panel-footer>div.text-info>div {
		font-size: 1em;
	}
	#preview #container-comments .panel-footer * {
		width: 100%;
		padding: 0;
		text-align: left;
	}
	#preview #container-comments .panel-footer, 
	#preview #container-comments .panel-body,
	#preview #container-comments .panel-heading {
		background: transparent;
		border:none;
	}
	#preview #container-comments .panel-footer {
		padding-top: 0;
	}
	#preview .panel {
		background-color: rgba(240, 240, 240, .3);
	}
	#preview .panel:hover {
		background: rgba(240, 240, 240, 1);
	}
	#preview #container-comments .panel-heading a,
	#preview #container-comments .panel-heading a:hover {
		color: #333;
	}
	#preview #container-comments .panel-heading {
		padding-bottom: 0;
	}
	#preview #container-comments .panel-heading p {
		display: inline-block;
		margin-bottom: 0;
		font-size: .8em;
	}
</style>
	<div id="blog" class="container-fluid">
		<div class="col-md-8 justify">
			<div id="container-posts">
				{% include 'blog/blog_content.tpl' %}
			</div>
			{% include 'blog/pagination.tpl' %}
		</div>
		<div class="col-md-4 justify">
			<div id="preview">
				{% if comments %}
					<h4>Комментарии:</h4>
				{% else %}
					<h4>Ни одного комментария не оставлено</h4>
				{% endif %}
				{% include 'blog/comment_content.tpl' %}
			</div>
		</div>
	</div>
	<script>
		window.onload = function() {
			makePreview('_preview-content', 8);
			makePreview('_preview-comment', 3);
		}
	</script>

{% endblock %}

