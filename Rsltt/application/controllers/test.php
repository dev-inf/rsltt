<?php

class Test_Controller extends Base_Controller {

	public $layout = 'theme.skull';

	/*public function __construct() {
		//$this->filter('before', 'auth')->except(array('hello'));
	}*/

	public function action_index()
	{
		//return View::make('home.index');
		return 'Test Coucou toi !';
	}

	public function action_hello(){
		//return 'Test Hello toi !';
		$this->layout->nest('content', 'theme.home.content');
	}

}