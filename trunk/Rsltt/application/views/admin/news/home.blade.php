@layout('admin.skull')

@section('content')

<table class="table table-stripped table-bordered table-hover">
	<thead>
		<tr>
			<th style="text-align:center;"><input type="checkbox"/></th>
			<th>Titre</th>
			<th>Créée par</th>
			<th>Date</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="4" style="text-align:center;"><b>Ajouter une news ...</b></td>
			<td>{{ HTML::link('/admin/news/add', 'Ajouter', array('class'=>'btn btn-success btn-mini')) }}</td>
		</tr>
		@foreach ($news as $new)
		<tr>
			<td style="text-align:center;"><input type="checkbox"/></td>
			<td title="{{ $new->short_content }}"><b>{{ $new->title }}</b></td>
			<td><a href="#viewProfile" data-idUser="{{ $new->user->id }}">{{ $new->user->firstname }} {{ $new->user->lastname }}</a></td>
			<td>{{ $new->created_at }}</td>
			<td>
				<a class="btn btn-warning btn-mini" href="#">Modifier</a>
				<a class="btn btn-danger btn-mini" href="#">Supprimer</a>
			</td>
		</tr>
		@endforeach
	</tbody>
</table>

@endsection