<?php

class Home_Controller extends Base_Controller
{

	public function action_index()
	{
        $user = User::find(2);
        
        var_dump($user->has('project', 3)->has('mailing', 7)->belong('template'));
        
		return View::make('home.index');
	}

}