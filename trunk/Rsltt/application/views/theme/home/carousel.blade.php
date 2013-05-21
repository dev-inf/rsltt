<div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators">
        @for ($i=0; $i< count($news); $i++)
            @if ($i == 0)
                <li data-target="#myCarousel" class="active" data-slide-to="{{ $i }}"></li>
            @else
                <li data-target="#myCarousel" data-slide-to="{{ $i }}"></li>
            @endif
        @endfor
    </ol>
    <div class="carousel-inner">
        @foreach ($news as $key => $new)
        @if ($key==0)
        <div class="item active">  
        @else
        <div class="item">  
        @endif
        
            {{ HTML::image('img/'.$new->image_url, '') }}
            <div class="carousel-caption">
                <h4>{{ $new->title }}</h4>
                <p>{{ $new->short_content }}</p>
            </div>
        </div>
        @endforeach
    </div>
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $('div.carousel-inner div.item').first(function() {
        $(this).addClass('active');
    });
});
</script>