<?php

class Admin_News_Controller extends Base_Controller {

	public $layout = 'admin.skull';

	/*public function __construct()
	{
		//$this->filter('before', 'auth');
	}*/

	public function action_index()
	{
		$news = Nouveaute::where('enable', '=', true)->order_by('created_at', 'desc')->get();

		return View::make('admin.news.home')->with('news',$news);
	}

	public function action_add()
	{
		return View::make('admin.news.add');
	}

	public function action_uploadImage()
	{
		$this->layout = '';
		//unset($this->layout);
		$picture = Input::all();
		var_dump($picture);
		return '';
	}

}