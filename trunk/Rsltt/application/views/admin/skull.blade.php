<!DOCTYPE html>
<html lang="en">
    <head>
        @include('admin.skull.head')
    </head>

    <body>
        @include('admin.skull.navbar')

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    @include('admin.skull.sidebar')
                </div><!--/span-->
                <div class="span9">
                    @yield('content')         
                </div><!--/span-->
            </div><!--/row-->

            <hr>

            <footer>
                @include('admin.skull.footer')
            </footer>

        </div><!--/.fluid-container-->
        @section('js')
        <!-- Le javascript
            ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        {{ HTML::script('js/jquery-1.9.1.min.js') }}
        {{ HTML::script('js/jquery-ui-1.10.2.custom.min.js') }}
        {{ HTML::script('js/bootstrap.min.js') }}
        @yield_section

    </body>
</html>