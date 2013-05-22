<?php

class GenerationChampionnat {

    public function start($championnat) {
        $champ = Championnat::find($championnat);

        $nbEquipe = $champ->champconf->nb_equipe;
        $nbJournee = $champ->champconf->nb_journee;

        $nbPhase = $champ->champconf->nb_phase;
        $champ8 = $this->champ8();

        foreach ($champ->journees as $j)
            $j->matches()->delete();
        $champ->journees()->delete();

        for ($i = 1; $i <= $nbJournee; $i++) {
            $currentJournee = $i;
            $currentPhase = 1;
            if ($nbPhase == 2) {
                if ($i > $nbJournee / 2) {
                    $currentPhase = 2;
                    $currentJournee = $i - $nbJournee / 2;
                }
            }
            $journee = new Journee(array(
                'numero' => $currentJournee,
                'enable' => true,
                'date' => ''
            ));
            $j = $champ->journees()->insert($journee);            
            foreach ($champ8[$currentPhase][$currentJournee] as $match) {
                $Ateam_d = $champ->teams()->where('place', '=', $match['d'])->get();
                $team_d = $Ateam_d[0];
                $Ateam_e = $champ->teams()->where('place', '=', $match['e'])->get();
                $team_e = $Ateam_e[0];
                $newMatch = new Match(array(
                    'team_d_id' => $team_d->id,
                    'team_e_id' => $team_e->id,
                    'score_d' => 0,
                    'score_e' => 0,
                    'played' => false,
                    'enable' => true
                ));
                $j->matches()->insert($newMatch);
            }
        }
    }

    private function champ8() {
        $match[1]['d'] = 1;
        $match[1]['e'] = 8;
        $match[2]['d'] = 2;
        $match[2]['e'] = 7;
        $match[3]['d'] = 3;
        $match[3]['e'] = 6;
        $match[4]['d'] = 4;
        $match[4]['e'] = 5;

        $journee[1] = $match;

        $match[1]['d'] = 7;
        $match[1]['e'] = 1;
        $match[2]['d'] = 6;
        $match[2]['e'] = 2;
        $match[3]['d'] = 5;
        $match[3]['e'] = 3;
        $match[4]['d'] = 8;
        $match[4]['e'] = 4;

        $journee[2] = $match;

        $match[1]['d'] = 1;
        $match[1]['e'] = 6;
        $match[2]['d'] = 2;
        $match[2]['e'] = 5;
        $match[3]['d'] = 3;
        $match[3]['e'] = 4;
        $match[4]['d'] = 8;
        $match[4]['e'] = 7;

        $journee[3] = $match;

        $match[1]['d'] = 5;
        $match[1]['e'] = 1;
        $match[2]['d'] = 4;
        $match[2]['e'] = 2;
        $match[3]['d'] = 3;
        $match[3]['e'] = 8;
        $match[4]['d'] = 6;
        $match[4]['e'] = 7;

        $journee[4] = $match;

        $match[1]['d'] = 1;
        $match[1]['e'] = 4;
        $match[2]['d'] = 2;
        $match[2]['e'] = 3;
        $match[3]['d'] = 7;
        $match[3]['e'] = 5;
        $match[4]['d'] = 8;
        $match[4]['e'] = 6;

        $journee[5] = $match;

        $match[1]['d'] = 3;
        $match[1]['e'] = 1;
        $match[2]['d'] = 2;
        $match[2]['e'] = 8;
        $match[3]['d'] = 4;
        $match[3]['e'] = 7;
        $match[4]['d'] = 5;
        $match[4]['e'] = 6;

        $journee[6] = $match;

        $match[1]['d'] = 1;
        $match[1]['e'] = 2;
        $match[2]['d'] = 7;
        $match[2]['e'] = 3;
        $match[3]['d'] = 6;
        $match[3]['e'] = 4;
        $match[4]['d'] = 8;
        $match[4]['e'] = 5;

        $journee[7] = $match;
        $phase[1] = $journee;

        $match[1]['d'] = 8;
        $match[1]['e'] = 1;
        $match[2]['d'] = 7;
        $match[2]['e'] = 2;
        $match[3]['d'] = 6;
        $match[3]['e'] = 3;
        $match[4]['d'] = 5;
        $match[4]['e'] = 4;

        $journee[1] = $match;

        $match[1]['d'] = 1;
        $match[1]['e'] = 7;
        $match[2]['d'] = 2;
        $match[2]['e'] = 6;
        $match[3]['d'] = 3;
        $match[3]['e'] = 5;
        $match[4]['d'] = 4;
        $match[4]['e'] = 8;

        $journee[2] = $match;

        $match[1]['d'] = 6;
        $match[1]['e'] = 1;
        $match[2]['d'] = 5;
        $match[2]['e'] = 2;
        $match[3]['d'] = 4;
        $match[3]['e'] = 3;
        $match[4]['d'] = 7;
        $match[4]['e'] = 8;

        $journee[3] = $match;

        $match[1]['d'] = 1;
        $match[1]['e'] = 5;
        $match[2]['d'] = 2;
        $match[2]['e'] = 4;
        $match[3]['d'] = 8;
        $match[3]['e'] = 3;
        $match[4]['d'] = 7;
        $match[4]['e'] = 6;

        $journee[4] = $match;

        $match[1]['d'] = 4;
        $match[1]['e'] = 1;
        $match[2]['d'] = 3;
        $match[2]['e'] = 2;
        $match[3]['d'] = 5;
        $match[3]['e'] = 7;
        $match[4]['d'] = 6;
        $match[4]['e'] = 8;

        $journee[5] = $match;

        $match[1]['d'] = 1;
        $match[1]['e'] = 3;
        $match[2]['d'] = 8;
        $match[2]['e'] = 2;
        $match[3]['d'] = 7;
        $match[3]['e'] = 4;
        $match[4]['d'] = 6;
        $match[4]['e'] = 5;

        $journee[6] = $match;

        $match[1]['d'] = 2;
        $match[1]['e'] = 1;
        $match[2]['d'] = 3;
        $match[2]['e'] = 7;
        $match[3]['d'] = 4;
        $match[3]['e'] = 6;
        $match[4]['d'] = 5;
        $match[4]['e'] = 8;

        $journee[7] = $match;
        $phase[2] = $journee;

        return $phase;
    }

}
?>