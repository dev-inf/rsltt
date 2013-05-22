<?php

class Admin_Championnats_Controller extends Base_Controller {
    /* public function __construct()
      {
      $this->filter('before', 'auth');
      } */

    public function action_index() {
        $championnats = Championnat::where('enable', '=', true)->get();

        return View::make('admin.championnats.index')->with('championnats', $championnats);
    }

    public function action_add() {
        return View::make('admin.championnats.add');
    }

    public function action_see($idChampionnat) {
        $champ = Championnat::find($idChampionnat);
        /*
          $classement = array();
          foreach ($champ->teams as $team) {
          $cltTeam['played_d'] = $team->matches_d()->where('played', '=', true)->count();
          $cltTeam['played_e'] = $team->matches_e()->where('played', '=', true)->count();

          $cltTeam['win_d'] = $team->matches_d()->where('played', '=', true)->where('score_d', '>', ((int) $champ->champconf->score_max / 2))->count();
          $cltTeam['win_e'] = $team->matches_e()->where('played', '=', true)->where('score_e', '>', ((int) $champ->champconf->score_max / 2))->count();

          $cltTeam['nul_d'] = $team->matches_d()->where('played', '=', true)->where('score_d', '=', ((int) $champ->champconf->score_max / 2))->count();
          $cltTeam['nul_e'] = $team->matches_e()->where('played', '=', true)->where('score_e', '=', ((int) $champ->champconf->score_max / 2))->count();

          $cltTeam['loose_d'] = $team->matches_d()->where('played', '=', true)->where('score_d', '<', ((int) $champ->champconf->score_max / 2))->count();
          $cltTeam['loose_e'] = $team->matches_e()->where('played', '=', true)->where('score_e', '<', ((int) $champ->champconf->score_max / 2))->count();

          //$win_e = $team->matches_e()->where('played', '=', true)->count();
          $classement[$team->id] = $cltTeam;
          } */

        return View::make('admin.championnats.see')->with('journees', $champ->journees()->order_by('numero', 'asc')->get())->with('champ', $champ);
    }

    public function action_generation($idChamp) {
        $champ = Championnat::find($idChamp);

        //var_dump($champ->champconf->phase_debut);

        Bundle::start('generation-championnat');

        $dump = new GenerationChampionnat();
        echo $dump->start($idChamp) . '<br/>';

        return "Backup complete.";
    }

    public function action_updateMatch($match, $score_d, $score_e) {
        $match = Match::find($match);

        $match->score_d = $score_d;
        $match->score_e = $score_e;
        $match->played = true;
        if ($score_d == "0" && $score_e == "0")
            $match->played = false;

        return $match->Save();
    }

}