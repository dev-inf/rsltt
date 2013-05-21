
<meta charset="utf-8">
<title>Panel Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
{{ HTML::style('css/bootstrap.min.css') }}
<style type="text/css">
body {
    padding-top: 60px;
    padding-bottom: 40px;
}
.sidebar-nav {
    padding: 9px 0;
}

@media (max-width: 980px) {
    /* Enable use of floated navbar text */
    .navbar-text.pull-right {
        float: none;
        padding-left: 5px;
        padding-right: 5px;
    }
}
ul.thumbnails li.span2:nth-child(6n + 7) {margin-left : 0px;}
</style>
{{ HTML::style('css/bootstrap-responsive.min.css') }}
{{ HTML::style('css/jquery-ui-1.10.2.custom.min.css') }}

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
{{ HTML::script('js/html5shiv.js') }}
<![endif]-->

