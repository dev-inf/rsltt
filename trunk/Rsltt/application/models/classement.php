<?php

class Classement extends Eloquent {

    public function championnat() {
        return $this->belongs_to('Championnat');
    }
    
    public function team() {
        return $this->belongs_to('Team');
    }

}

?>
