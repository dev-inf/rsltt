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

<div id="myTabContent" class="tab-content span10 offset1">
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
                        <th class='span1'></th>
                    </tr>
                </thead>    
                <tbody>
                    @foreach($j->matches as $match)
                    <tr>
                        <td style='text-align: right;'>{{ HTML::Link($match->team_d->id, $match->team_d->club->abreviation.' '. $match->team_d->numero)}}</td>
                        <td class='span1' style='text-align: center;' contenteditable='true' data-match='{{$match->id}}' data-reset='{{$match->score_d}}' data-team='d'>{{ $match->score_d}}</td>
                        <td class='span1' style='text-align: center;' contenteditable='true' data-match='{{$match->id}}' data-reset='{{$match->score_e}}' data-team='e'>{{ $match->score_e}}</td>
                        <td>{{ HTML::Link($match->team_e->id, $match->team_e->club->abreviation.' '. $match->team_e->numero)}}</td>
                        <td><button class="btn btn-warning btn-mini" name="reset" data-match='{{$match->id}}'>RàZ</button></td>
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

    <ul class="nav nav-tabs">
        <li class="active"><a href="#classement" data-toggle="pill">Classement</a></li>
        <li><a href="#classement_domicile" data-toggle="pill">Classement Domicile</a></li>
        <li><a href="#classement_exterieur" data-toggle="pill">Classement Exterieur</a></li>
    </ul>

    <div id="myTabContent2" class="tab-content span8 offset2">
        <div class="tab-pane fade in active" id="classement">
            <table class='table table-stripped table-bordered table-hover' id="classement">
                <thead>
                    <tr>
                        <th class='span1' style='text-align: center;'>Place</th>
                        <th class='span6'>Equipe</th>
                        <th class='span1' style='text-align: center;'>J</th>
                        <th class='span1' style='text-align: center;'>V</th>
                        <th class='span1' style='text-align: center;'>N</th>
                        <th class='span1' style='text-align: center;'>D</th>
                        <th class='span1' style='text-align: center;'>PTS</th>
                    </tr>
                </thead>    
                <tbody>
                    @foreach($champ->classement as $key=>$clt)
                    <?php $table[$clt->team->id] = $key + 1; ?>
                    <tr>
                        <td style='text-align: center;'><b>{{$key+1}}</b></td>
                        <td>{{$clt->team->club->nom.' <i>('.$clt->team->club->abreviation.')</i> '.$clt->team->numero}}</td>
                        <td style='text-align: center;'>{{$clt->played}}</td>
                        <td style='text-align: center;'>{{$clt->win}}</td>
                        <td style='text-align: center;'>{{$clt->nul}}</td>
                        <td style='text-align: center;'>{{$clt->loose}}</td>
                        <td style='text-align: center;'>{{$clt->points}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="tab-pane fade in" id="classement_domicile">
            <table class='table table-stripped table-bordered table-hover' id="classement_domicile">
                <thead>
                    <tr>
                        <th class='span1' style='text-align: center;'>Place</th>
                        <th class='span6'>Equipe</th>
                        <th class='span1' style='text-align: center;'>J</th>
                        <th class='span1' style='text-align: center;'>V</th>
                        <th class='span1' style='text-align: center;'>N</th>
                        <th class='span1' style='text-align: center;'>D</th>
                        <th class='span1' style='text-align: center;'>PTS</th>
                    </tr>
                </thead>    
                <tbody>
                    @foreach($champ->classement()->order_by('points_d', 'desc')->get() as $key=>$clt)
                    <tr>
                        <td style='text-align: center;'><b>{{$key+1}}</b> <i>({{$table[$clt->team->id]}})</i></td>
                        <td>{{$clt->team->club->nom.' <i>('.$clt->team->club->abreviation.')</i> '.$clt->team->numero}}</td>
                        <td style='text-align: center;'>{{$clt->played_d}}</td>
                        <td style='text-align: center;'>{{$clt->win_d}}</td>
                        <td style='text-align: center;'>{{$clt->nul_d}}</td>
                        <td style='text-align: center;'>{{$clt->loose_d}}</td>
                        <td style='text-align: center;'>{{$clt->points_d}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="tab-pane fade in" id="classement_exterieur">
            <table class='table table-stripped table-bordered table-hover' id="classement_exterieur">
                <thead>
                    <tr>
                        <th class='span1' style='text-align: center;'>Place</th>
                        <th class='span6'>Equipe</th>
                        <th class='span1' style='text-align: center;'>J</th>
                        <th class='span1' style='text-align: center;'>V</th>
                        <th class='span1' style='text-align: center;'>N</th>
                        <th class='span1' style='text-align: center;'>D</th>
                        <th class='span1' style='text-align: center;'>PTS</th>
                    </tr>
                </thead>    
                <tbody>
                    @foreach($champ->classement()->order_by('points_e', 'desc')->get() as $key=>$clt)
                    <tr>
                        <td style='text-align: center;'><b>{{$key+1}}</b> <i>({{$table[$clt->team->id]}})</i></td>
                        <td>{{$clt->team->club->nom.' <i>('.$clt->team->club->abreviation.')</i> '.$clt->team->numero}}</td>
                        <td style='text-align: center;'>{{$clt->played_e}}</td>
                        <td style='text-align: center;'>{{$clt->win_e}}</td>
                        <td style='text-align: center;'>{{$clt->nul_e}}</td>
                        <td style='text-align: center;'>{{$clt->loose_e}}</td>
                        <td style='text-align: center;'>{{$clt->points_e}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    @endsection


    @section('js')
    @parent
    @if(isset($js) && is_array($js))
    @foreach($js as $j)
    {{HTML::script($j)}}
    @endforeach

    @endif
    {{HTML::script("js/jquery.tablesorter.js")}}

    <style>
        td[contenteditable=true].error {
            border:2px solid red;
        }
        th.header{
         cursor: pointer; 
        }
        th.headerSortDown
        {background-image: url(/Rsltt/public/img/asc.gif);  
         background-repeat: no-repeat; 
         background-position: bottom center; 
         margin-left: -1px; 
        }
        th.headerSortUp
        {background-image: url(/Rsltt/public/img/desc.gif); 
         background-repeat: no-repeat; 
         background-position: bottom center; 
         margin-left: -1px; 
        }
    </style>

    <script>
        $(document).ready(function() {
            $("table#classement").tablesorter( {sortList: [[0,0],[6,1]]} ); 
            $("table#classement_domicile").tablesorter( {sortList: [[0,0],[6,1]]} ); 
            $("table#classement_exterieur").tablesorter( {sortList: [[0,0],[6,1]]} ); 

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
            $('button[name=reset]').on('click', function() {
                postScore($(this).attr('data-match'), 0, 0);
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

        $(document).on('click', function() {
            $('.alert').slideUp('fast');
        })
    </script>
    @endsection