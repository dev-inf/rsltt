<?php

class Team extends Eloquent {
	
	public function club()
    {
          return $this->belongs_to('Club');
    }

    public function championnats()
    {
          return $this->has_many_and_belongs_to('Championnat');
    }

    public function matches()
    {
    	return $this->has_many('Match');
    }
}

?>