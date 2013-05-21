<?php

class AdminPanel_Controller extends Base_Controller {

	public $layout = 'admin.index';

	/*public function __construct()
	{
		//$this->filter('before', 'auth');
	}*/

	public function action_index()
	{
		echo 'coucou';
		$this->layout->nest('content', 'admin.access.index');
	}

	public function action_test($id='null',$id2='null')
	{
		return $id.'.'.$id2;
	}

}