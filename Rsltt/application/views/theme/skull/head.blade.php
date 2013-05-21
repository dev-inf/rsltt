<meta charset="utf-8">
{{ HTML::style('css/bootstrap.min.css') }}
{{ HTML::style('css/design.css') }}
{{ HTML::script('js/jquery-1.9.1.min.js') }}
{{ HTML::script('js/bootstrap.min.js') }}
<script type="text/javascript">
$(document).ready(function() {
    $('#myCarousel').carousel();
    $('#myCarousel2').carousel({
        interval: 2000
    });
});
</script>
