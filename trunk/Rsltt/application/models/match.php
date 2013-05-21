<?php

class Match extends Eloquent {
	
    public function team_d()
    {
          return $this->belongs_to('Team', 'team_d_id');
    }
    public function team_e()
    {
          return $this->belongs_to('Team', 'team_e_id');
    }

    public function journee()
    {
          return $this->belongs_to('Journee');
    }
}

?>