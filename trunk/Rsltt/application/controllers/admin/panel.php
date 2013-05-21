<?php
class Admin_Panel_Controller extends Base_Controller {

	public function action_index()
	{
		return View::make('admin.index');
	}

	public function action_test()
	{
		$this->layout->nest('content', 'admin.contentPanel');
	}
}