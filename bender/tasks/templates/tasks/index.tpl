{% extends 'core/base.tpl' %}
{% import 'tasks/macros.tpl' as macros %}

{% block title %}Задачи{% endblock %}

{% block content %}
<div class="container-fluid">
    <div class="row">
        <center>
            <h1>Задачи</h1>
        </center>
        <hr>
    </div>
    <div class="row">
        <br>
        <div class="col-md-1">&nbsp;</div>
        <div class="col-md-7">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Название</th>
                        <th>Статус</th>
                        <th>Дата публикации</th>
                    </tr>
                </thead>
                <tbody>
                    {% for task in tasks %}
                    <tr>
                        <td><strong>{{ task.pk }}</strong></td>
                        <td>
                            <a href="{{ url('tasks:task', task.pk)}}">{{ task.title }}</a></td>
                        <td>-</td>
                        <td>-</td>
                    </tr>
                    {% endfor %}
                </tbody>
            </table>
        </div>
        <div class="col-md-3">
            <ul class="list-group">
                <li class="list-group-item" style="background: #e1e1e1;"><center><strong>Статусы</strong></center></li>
                <li class="list-group-item">{{ macros.status_label('code works') }} - код работает</li>
                <li class="list-group-item">{{ macros.status_label('code compiles') }} - не пройдены тесты</li>
                <li class="list-group-item">{{ macros.status_label('code fail') }} - не компилируется</li>
            </ul>
        </div>
        <div class="col-md-1">&nbsp;</div>
    </div>
</div>
        
{% endblock %}