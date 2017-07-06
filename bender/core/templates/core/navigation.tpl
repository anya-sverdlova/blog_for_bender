<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="collapsed navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-9" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
        <span class="icon-bar"></span> <span class="icon-bar"></span>
      </button>
      <a href="{{ url('tasks:index') }}" class="navbar-brand">BCW6</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
      <ul class="nav navbar-nav">
        <li><a href="{{ url('tasks:index') }}">Задачи</a></li>
        <li><a href="/blog">Блог</a></li>
        <!-- <li><a href="#">Link</a></li> -->
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="{{ url('logout') }}">Выйти</a></li>
      </ul>
      <p class="navbar-text navbar-right">Привет, <a href="#" class="navbar-link">{{ user.username}}</a></p>
    </div>
  </div>
</nav>