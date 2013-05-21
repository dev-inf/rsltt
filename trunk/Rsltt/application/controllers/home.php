<?php

class Home_Controller extends Base_Controller {

	public $layout = 'theme.skull';

	public function action_index()
	{
		$news = Nouveaute::where('enable', '=', true)->order_by('created_at', 'desc')->take(5)->get();
		$this->layout->nest('content', 'theme.home.content', array('news'=>$news));
	}

	public function action_hello(){
		return 'Hello toi !';
	}

}