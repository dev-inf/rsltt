@layout('admin.skull')

@section('content')

<table class="table table-stripped table-bordered table-hover">
  <thead>
    <tr>
      <th>Libellé</th>
      <th style="width:20%;">Action</th>
    </tr>
  </thead>
  <tbody>
    @foreach ($rights as $right)
    <tr>
      <td>{{$right->libelle}}</td>
      <td style="text-align:center;">
        <a class="btn btn-mini btn-warning">Modifier</a>
        <a class="btn btn-mini btn-danger">Supprimer</a>
      </td>
    </tr>
    @endforeach
  </tbody>
</table>

@endsection