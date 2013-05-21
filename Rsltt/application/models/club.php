<?php

class Club extends Eloquent {
	
	public function teams()
    {
          return $this->has_many('Team');
    }
}

?>