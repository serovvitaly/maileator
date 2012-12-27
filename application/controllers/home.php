<?php

class Home_Controller extends Base_Controller
{

	public function action_index()
	{
        $user = User::find(2);
        
		return View::make('home.index');
	}

}