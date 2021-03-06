<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in</title>
    <link href="{{ STATIC_URL }}/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
          padding-top: 40px;
          padding-bottom: 40px;
          background-color: #eee;
        }

        .form-signin {
          max-width: 330px;
          padding: 15px;
          margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
          margin-bottom: 10px;
        }
        .form-signin .checkbox {
          font-weight: normal;
        }
        .form-signin .form-control {
          position: relative;
          height: auto;
          -webkit-box-sizing: border-box;
             -moz-box-sizing: border-box;
                  box-sizing: border-box;
          padding: 10px;
          font-size: 16px;
        }
        .form-signin .form-control:focus {
          z-index: 2;
        }
        .form-signin input[type="email"] {
          margin-bottom: -1px;
          border-bottom-right-radius: 0;
          border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
          margin-bottom: 10px;
          border-top-left-radius: 0;
          border-top-right-radius: 0;
        }
    </style>
  </head>

  <body>
    <div class="container">
      <form class="form-signin" method="POST" action="{{ url('login') }}">
        <h2 class="form-signin-heading">Вход</h2>
        <label for="{{ form.username.id_for_label }}" class="sr-only">Имя пользователя</label>
        <input type="text" id="{{ form.username.id_for_label }}" name={{ form.username.name }} class="form-control" placeholder="username" required autofocus>
        <label for="{{ form.password.id_for_label }}" class="sr-only">Пароль</label>
        <input type="password" name={{ form.password.name }} id="{{ form.password.id_for_label }}" class="form-control" placeholder="password" required>
        {% csrf_token %}
        <button class="btn btn-lg btn-primary btn-block" type="submit">Авторизоваться</button>
      </form>
    </div>
  </body>
</html>
