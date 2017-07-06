{% extends 'core/base.tpl' %}
{% block css %}
    {{ super() }}
    <style type="text/css" media="screen">
        #editor { 
            position: relative;
            width: 100%;
            height: 400px;
            margin-top: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1em;
        }
    </style>
{% endblock %}

{% import 'tasks/macros.tpl' as macros %}

{% block title %}{{ task.title }}{% endblock %}

{% block content %}
<div class="container-fluid">
    <div class="row">
        <center>
            <h1>{{ task.title }}</h1>
        </center>
        <hr>
    </div>
    <div class="row">
        <br>
        <div class="col-md-1">&nbsp;</div>
        <div class="col-md-6">
            <h3>Отправить код</h3>
            <div id="editor" data-source="{{ url('tasks:review', task.id) }}">#include &lt;stdio.h&gt;

int main() {
    printf("Hello, world!");
    return 0;
}
</div>
            {% csrf_token %}
            <button onclick="sendCode();" class="btn btn-success">Отправить</button>
            <br><br>
            <div class="alert alert-warning" role="alert">
                <strong>Test fail!</strong> Some useful text.
            </div>
            <div class="alert alert-danger" role="alert">
                <strong>Error!</strong> Error message.
            </div>
        </div>
        <div class="col-md-4">
            <h3>Описание</h3>
            <div>
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#descr" aria-controls="descr" role="tab" data-toggle="tab">Условие задачи</a>
                </li>
                <li role="presentation">
                    <a href="#input" aria-controls="input" role="tab" data-toggle="tab">Входящие данные</a>
                </li>
                <li role="presentation">
                    <a href="#output" aria-controls="output" role="tab" data-toggle="tab">Ожидаемый вывод</a>
                </li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane active" id="descr">
                    <br>{{ task.description }}
                </div>
                <div class="tab-pane" id="input">
                    {% if task.input_example %}
                        <br>{{ task.input_example }}
                    {% else %}
                        <br>В задаче не предусмотрены входящие данные.
                    {% endif %}
                </div>
                <div class="tab-pane" id="output">
                    <br>{{ task.output_example }}
                </div>
              </div>
            </div>
            <br><br>
            <h3>История</h3>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Версия</th>
                        <th>Дата</th>
                        <th>Статус</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>v1</td>
                        <td>01.07.2017 21:05:47</td>
                        <td>{{ macros.status_label('code works')}}</td>
                    </tr>
                    <tr>
                        <td>v1</td>
                        <td>01.07.2017 21:05:47</td>
                        <td>{{ macros.status_label('code compiles')}}</td>
                    </tr>
                    <tr>
                        <td>v1</td>
                        <td>01.07.2017 21:05:47</td>
                        <td>{{ macros.status_label('code fail')}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-1">&nbsp;</div>
    </div>
</div>
{% endblock %}

{% block js %}
    {{ super() }}
    <script src="{{ STATIC_URL }}ace/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
    <script>
        var editor = ace.edit("editor");
        editor.setTheme("ace/theme/xcode");
        editor.getSession().setMode("ace/mode/c_cpp");

        function sendCode() {
            var code = editor.getValue();
            var uri = document.location.origin + document.getElementById('editor').dataset.source;
            var csrf_token = document.getElementsByName('csrfmiddlewaretoken')[0].value;

            var sender = new XMLHttpRequest();
            sender.withCredentials = true;
            sender.open("POST", uri, true);
            sender.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            sender.setRequestHeader("X-CSRFToken", csrf_token);
            sender.onreadystatechange = function () {
                if( this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                    console.log(JSON.parse(this.responseText));
                }
            };
            sender.send(JSON.stringify({code:code}));
        };
    </script>
{% endblock %}