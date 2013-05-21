<div class="well sidebar-nav">
    <ul class="nav nav-list">
        <li class="nav-header">Accès</li>
        <li>{{ HTML::link('/admin/users', 'Utilisateurs') }}</li>
        <li>{{ HTML::link('/admin/groups', 'Groupes') }}</li>
        <li>{{ HTML::link('/admin/rights', 'Droits') }}</li>
        <li class="nav-header">&Eacute;quipes</li>
        <li><a href="#">Link</a></li>
        <li class="nav-header">Joueurs</li>
        <li><a href="#">Link</a></li>
        <li class="nav-header">Autres...</li>
        <li>{{ HTML::link('/admin/news', 'News') }}</li>
        <li>{{ HTML::link('/admin/championnats', 'Championnats') }}</li>
    </ul>
</div><!--/.well -->