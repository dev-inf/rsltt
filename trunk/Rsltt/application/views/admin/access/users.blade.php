@layout('admin.skull')

@section('content')

<ul class="thumbnails">
  <li class="span2">
    <div class="thumbnail">
      {{ HTML::image('img/Users/default.png', 'Ajouter un utilisateur...')}}
      <h4 style="text-align:center;">...</h4>
      <p style="text-align:center;">
      	<a href="#" class="btn btn-success">Ajouter un nouveau</a>
      </p>
    </div>
  </li>
	@foreach ($users as $user)
  <li class="span2">
    <div class="thumbnail">
      {{ HTML::image('img/Users/'.$user->avatar_url, $user->firstname)}}
      <p style="text-align:center; margin-top:5px;"><b>{{$user->civility->libelle}} {{$user->firstname}} {{Str::upper($user->lastname)}}</b></p>
      <p style="text-align:center;">
      	<a href="#" class="btn btn-warning">Modifier</a>
      	<a href="#" class="btn btn-mini btn-danger">Supprimer</a>
      </p>
    </div>
  </li>
  @endforeach
</ul>

@endsection