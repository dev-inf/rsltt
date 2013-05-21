<html>
<head>
    @include('theme.skull.head')
</head>
<body>
    <nav>
        @include('theme.skull.navbar')
    </nav>

    <header>
        @include('theme.skull.header')
    </header>

    <section>
        {{ $content }}
    </section>

    <footer>
        @include('theme.skull.footer')
    </footer>
</body>
</html>