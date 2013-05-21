@layout('admin/skull')

@section('content')

<table class="table table-stripped table-bordered table-hover">
    <thead>
        <tr>
            <th>Champ</th>
            <th>Actions</th>
        </tr>
    </thead>
    @if($championnats)
    @foreach($championnats as $champ)
    <tr>
        <td>{{ $champ->niveau.' '.$champ->division }} (Poule {{ $champ->poule }})</td>
        <td>{{ HTML::Link('/admin/championnats/see/'.$champ->id, 'Accèder', array('class'=>'btn btn-success btn-mini')) }}</td>        
    </tr>
    @endforeach
    @endif
</table>
@endsection