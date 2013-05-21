<?php

class Admin_Users_Controller extends Base_Controller {

	/*public function __construct()
	{
		//$this->filter('before', 'auth');
	}*/

	public function action_index()
	{
		$users = User::where('enable', '=', true)->order_by('lastname', 'asc')->get();

		return View::make('admin.access.users')->with('users',$users);
	}

}