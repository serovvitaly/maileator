<?php

class Project extends Maileator
{
    public function mailings()
    {
        return $this->has_many('Mailing');
    }
}