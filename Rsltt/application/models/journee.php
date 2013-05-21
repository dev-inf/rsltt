<?php

class Journee extends Eloquent {
	
	public function championnat()
    {
          return $this->belongs_to('Championnat');
    }

    public function matches()
    {
    	return $this->has_many('Match');
    }
}

?>