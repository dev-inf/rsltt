<?php

class Championnat extends Eloquent {

    public function journees() {
        return $this->has_many('Journee');
    }

    public function teams() {
        return $this->has_many_and_belongs_to('Team');
    }
    
    public function champconf()
    {
        return $this->belongs_to('Champconf');
    }
    
    public function classement()
    {
        return $this->has_many('Classement');
    }

}

?>