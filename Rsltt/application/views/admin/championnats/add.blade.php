@layout('admin/skull')
@section('content')

{{ Form::Open() }} <br />
{{ Form::Token() }} <br />
{{ Form::Text('niveau', '', array('placeholder'=>'Niveau')) }} <br /> 
{{ Form::Text('division', '', array('placeholder'=>'Division')) }} <br />
{{ Form::Text('poule', '', array('placeholder'=>'Poule')) }} <br />
{{ Form::Text('saison', '', array('placeholder'=>'Saison')) }} <br />
{{ Form::Text('phase', '', array('placeholder'=>'phase')) }}<br />
{{ Form::Submit() }}<br />
{{ Form::Close() }}

@endsection