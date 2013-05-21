<?php

class Admin_Championnats_Controller extends Base_Controller {
    /* public function __construct()
      {
      //$this->filter('before', 'auth');
      } */

    public function action_index() {
        $championnats = Championnat::where('enable', '=', true)->get();

        return View::make('admin.championnats.index')->with('championnats', $championnats);
    }

    public function action_add() {
        return View::make('admin.championnats.add');
    }
    
    public function action_see($idChampionnat)
    {
        $champ = Championnat::find($idChampionnat);
                
        return View::make('admin.championnats.see')->with('journees', $champ->journees()->order_by('numero', 'asc')->get());
    }

}