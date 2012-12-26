<?php
/**
* Базовая модель пользователей
*/
class User extends Maileator
{
    protected $_has_many_foreign = 'owner_id';
    
    /**
    * Возвращает модель проекта с заданным ID
    * 
    * @param mixed $project_id - ID проекта
    */
    public function project($project_id)
    {
        $project = $this->projects()->where('id', '=', $project_id)->first();
        
        if ($project) {
            $project = Project::find($project->attributes['id']);
        }
        
        return $project;
    }
    
    
    /**
    * Возвращает список всех проектов пользователя
    * 
    */
    public function projects()
    {
        return $this->has_many('Project', 'owner_id');
    }
}