<?php

class User extends Eloquent {
	
	public function civility()
    {
          return $this->belongs_to('Civility');
    }

    public function groups()
    {
          return $this->has_many_and_belongs_to('Group');
    }
}

?>