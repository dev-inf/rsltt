@layout('admin/skull')

@section('content')



<ul class="nav nav-tabs">
    @foreach($journees as $key=> $j)
    @if($key==0)
    <li class="active">
        @else
    <li>
        @endif
        <a href="#journee{{$j->numero}}" data-toggle="pill">Journee {{$j->numero}}</a></li>
    @endforeach    
</ul>

<div id="myTabContent" class="tab-content span8 offset2">
    @foreach($journees as $key=> $j)
    @if($key==0)
    <div class="tab-pane fade in active" id="journee{{$j->numero}}">
        @else
        <div class="tab-pane fade in" id="journee{{$j->numero}}">
            @endif
            <table class='table table-stripped table-bordered table-hover'>
                <thead>
                    <tr>
                        <th class='span5' style='text-align: right;'>Domcile</th>
                        <th colspan='2' style='text-align: center;'>Score</th>
                        <th class='span5'>Exterieur</th>
                    </tr>
                </thead>    
                <tbody>
                    @foreach($j->matches as $match)
                    <tr>
                        <td style='text-align: right;'>{{ $match->team_d->club->nom.' '. $match->team_d->numero}}</td>
                        <td class='span1' style='text-align: center;' contenteditable='true' data-match='{{$match->id}}' data-reset='{{$match->score_d}}' data-team='d'>{{ $match->score_d}}</td>
                        <td class='span1' style='text-align: center;' contenteditable='true' data-match='{{$match->id}}' data-reset='{{$match->score_e}}' data-team='e'>{{ $match->score_e}}</td>
                        <td>{{ $match->team_e->club->nom.' '. $match->team_e->numero}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        @endforeach    
    </div>
    
    <div class="alert alert-success span10 offset1" data-name="addedSuccessfully" style="display: none;">
    Les données ont été modifiées avec succès.
    <a href="#" class="close" data-dismiss="alert">&times;</a>
</div>
    @endsection


    @section('js')
    @parent
    @if(isset($js) && is_array($js))
    @foreach($js as $j)
    {{HTML::script($j)}}
    @endforeach
    @endif

    <style>
        td[contenteditable=true].error {
            border:2px solid red;
        }
    </style>

    <script>
        $(document).ready(function() {
            $('td[contenteditable=true]').on('blur', function() {
                console.log($.trim($(this).html()));
                if ($(this).html() != $(this).attr('data-reset')) {
                    if (!$.isNumeric($(this).html())) {
                        $(this).addClass('error');
                        $(this).html($(this).attr('data-reset'));
                    }
                    else {
                        var i = parseInt($(this).html());
                        if (i < 0 || i > 20) {
                            $(this).addClass('error');
                            $(this).html($(this).attr('data-reset'));
                        }
                        else {
                            $(this).removeClass('error');
                            if ($(this).attr('data-team') == 'd')
                                $('td[data-match=' + $(this).attr('data-match') + '][data-team=e]').html(20 - i);
                            else
                                $('td[data-match=' + $(this).attr('data-match') + '][data-team=d]').html(20 - i);

                            postScore($(this).attr('data-match'), $('td[data-match=' + $(this).attr('data-match') + '][data-team=d]').html(), $('td[data-match=' + $(this).attr('data-match') + '][data-team=e]').html());
                        }
                    }
                }
                else {
                    $(this).removeClass('error');
                }
            });
        });

        function postScore(idMatch, scoreDomicile, scoreExterieur)
        {
            $.ajax({
                url: "{{ URL::base().'/admin/championnats/updateMatch/' }}" + idMatch + "/" + scoreDomicile + "/" + scoreExterieur,
                success: function(e) {
                    if (e == "1") {
                        $('td[data-match=' + idMatch + '][data-team=d]').attr('data-reset', scoreDomicile).html(scoreDomicile);
                        $('td[data-match=' + idMatch + '][data-team=e]').attr('data-reset', scoreExterieur).html(scoreExterieur);
                        $('div.alert-success[data-name=addedSuccessfully]').slideDown('fast');
                    }
                }
            });
        }
        
        $(document).on('click', function(){$('.alert').slideUp('fast');})
    </script>
    @endsection