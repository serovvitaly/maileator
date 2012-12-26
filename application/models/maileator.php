<?php

class Maileator extends Eloquent
{
    protected $_has_many_foreign = NULL;
    
    
    /**
    * Универсальный метод связывания моделей по отношению One-To-Many
    * 
    * @param mixed $model
    * @param mixed $id
    * @param mixed $as_model
    */
    public function has($model, $id = 0, $as_model = true)
    {
        $model = ucfirst($model);
        
        $output = NULL;
        
        if ($id > 0) {
            $there_first = $this->has_many($model, $this->_has_many_foreign)->where('id', '=', $id)->first();
            
            if ($there_first) {
                if ($as_model === true) {
                    $output = $model::find($there_first->attributes['id']);
                }
                else {
                    $output = $there_first;
                }
            }
        }
        else {
            $output = $this->has_many($model, $this->_has_many_foreign);
        }
        
        return $output;
    }
}
