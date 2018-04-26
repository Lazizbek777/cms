<?php

namespace Tours\Form;

use Application\Form\Form;
use Phalcon\Forms\Element\Text;
use Tours\Model\Country;

class CountryForm extends Form
{

    public function initialize()
    {
        $this->add((new Text('title', array('required' => true)))->setLabel('Заголовок'));
        $this->add((new Text('slug', array('required' => true, 'data-description' => 'Пример: category')))->setLabel('Ссылка'));         
    }    

} 