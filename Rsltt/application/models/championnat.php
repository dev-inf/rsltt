<?php

class Championnat extends Eloquent {
	
	public function journees()
    {
          return $this->has_many('Journee');
    }

    public function teams()
    {
          return $this->has_many_and_belongs_to('Team');
    }
}

?>