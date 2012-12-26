<?php

class Project extends Eloquent
{
    public function mailings()
    {
        return $this->has_many('Mailing');
    }
}