@layout('admin.skull')

@section('content')

<ul class="thumbnails">
  <li class="span2">
    <div class="thumbnail">
      {{ HTML::image('img/Groups/default.png', 'Ajouter un groupe...', array('style' => 'height:200px;'))}}
      <h4 style="text-align:center;">...</h4>
      <p style="text-align:center;">()</p>
      <p style="text-align:center;">
      	<a href="#" class="btn btn-success">Ajouter un nouveau</a>
      </p>
    </div>
  </li>
	@foreach ($groups as $group)
  <li class="span2">
    <div class="thumbnail">
      {{ HTML::image('img/Groups/'.$group->avatar_url, $group->name, array('style' => 'height:200px;'))}}
      <h4 style="text-align:center;">{{$group->name}}</h4>
      <p style="text-align:center;">({{$countUser = $group->users()->count() }} {{Str::plural('utilisateur', $countUser)}})</p>
      <p style="text-align:center;">
      	<a href="#" class="btn btn-warning">Modifier</a>
      	<a href="#" class="btn btn-mini btn-danger">Supprimer</a>
      </p>
    </div>
  </li>
  @endforeach
</ul>

@endsection