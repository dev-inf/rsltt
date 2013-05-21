<?php

class Admin_Rights_Controller extends Base_Controller {

	/*public function __construct()
	{
		//$this->filter('before', 'auth');
	}*/

	public function action_index()
	{
		$rights = Right::where('enable', '=', true)->order_by('libelle', 'asc')->get();

		return View::make('admin.access.rights')->with('rights',$rights);
	}

}