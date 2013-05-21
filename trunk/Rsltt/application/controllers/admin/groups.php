<?php

class Admin_Groups_Controller extends Base_Controller {

	/*public function __construct()
	{
		//$this->filter('before', 'auth');
	}*/

	public function action_index()
	{
		$groups = Group::where('enable', '=', true)->order_by('name', 'asc')->get();

		return View::make('admin.access.groups')->with('groups',$groups);
	}

}