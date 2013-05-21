<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">Administration rsltt.fr</a>
            <div class="nav-collapse collapse">
                <p class="navbar-text pull-right">
                    Connecté en tant que <a href="#" class="navbar-link">Username</a>
                </p>
                <ul class="nav">
                    <li class="active">{{ HTML::link('/admin/', 'Accueil') }}</li>
                    <li><a href="#about">Accès</a></li>
                    <li><a href="#about">Equipes</a></li>
                    <li><a href="#about">Joueurs</a></li>
                    <li><a href="#about">Autres...</a></li>
                    <li>{{ HTML::link('', 'Accèder au site') }}</li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>