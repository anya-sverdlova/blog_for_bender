<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
      {% block title %}Base{% endblock %}
    </title>
    {% block css %}
      <link href="{{ STATIC_URL }}css/bootstrap.min.css" rel="stylesheet">
    {% endblock %}
  </head>
  <body>
    {% include 'core/navigation.tpl' %}
    
    {% block content %}
      <h1>Index</h1>
    {% endblock %}
    
    {% block js %}
      <script type="text/javascript"  src="{{ STATIC_URL }}js/makePreview.js"></script>
      <script type="text/javascript" src="{{ STATIC_URL }}js/clamp.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <script src="{{ STATIC_URL }}js/bootstrap.min.js"></script>
    {% endblock %}
  </body>
</html>