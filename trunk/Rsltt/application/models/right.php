<?php

class Right extends Eloquent {
	

    public function Groups()
    {
          return $this->has_many_and_belongs_to('group');
    }
}

?>