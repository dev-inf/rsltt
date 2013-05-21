
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Connection</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Le styles -->
	{{ HTML::style('css/bootstrap.min.css') }}
	<style type="text/css">
	body {
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #f5f5f5;
	}

	.form-signin {
		max-width: 300px;
		padding: 19px 29px 29px;
		margin: 0 auto 20px;
		background-color: #fff;
		border: 1px solid #e5e5e5;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
		-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
		-moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
		box-shadow: 0 1px 2px rgba(0,0,0,.05);
	}
	.form-signin .form-signin-heading,
	.form-signin .checkbox {
		margin-bottom: 10px;
	}
	.form-signin input[type="text"],
	.form-signin input[type="password"] {
		font-size: 16px;
		height: auto;
		margin-bottom: 15px;
		padding: 7px 9px;
	}

	</style>

	{{ HTML::style('css/jquery-ui-1.10.2.custom.min') }}

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    	{{ HTML::script('js/html5shiv.js') }}
    	<![endif]-->

    </head>

    <body>

    	<div class="container">

    		<form class="form-signin">
    			<h2 class="form-signin-heading">Identifiez-vous</h2>
    			<input type="text" class="input-block-level" placeholder="Adresse e-mail">
    			<input type="password" class="input-block-level" placeholder="Mot de Passe">
    			<button class="btn btn-large btn-primary" type="submit">Connection</button>
    			<button class="btn btn-large btn-warning" type="submit" style="float:right;">Annuler</button>
    		</form>

    	</div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    {{ HTML::script('js/jquery-1.9.1.min.js') }}
    {{ HTML::script('js/jquery-ui-1.10.2.custom.min') }}
    {{ HTML::script('js/bootstrap.min.js') }}

</body>
</html>
