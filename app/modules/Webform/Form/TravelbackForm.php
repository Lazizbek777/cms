<?php

namespace Webform\Form;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Date;
use Application\Form\Form;
use Phalcon\Validation\Validator\PresenceOf;

class TravelbackForm extends Form
{

    public function initialize()
    {
        $tour = new Text("tour", ['required' => true, 'class' => 'form-control', 'readonly' => 'readonly']);
        $name = new Text("name", ['required' => true, 'class' => 'form-control', 'size'=>"40" ,'placeholder' => 'Ф.И.О']);
        $email = new Email("email", ['required' => true, 'class' => 'form-control', 'size'=>"40" , 'placeholder' => 'Email']);
        $phone = new Numeric("phone", ['required' => true, 'class' => 'form-control', 'size'=>"40" , 'placeholder' => 'Телефон']);     
        $request = new TextArea("request", ['class' => 'form-control', 'placeholder' => 'Спец запрос']);      
        $date = new Date("date", ['required' => false ,'class' => 'form-control','id'=>'datetimepicker', 'placeholder' => 'Назначте Дату']);      
       

        $this->add($tour);
        $this->add($name);
        $this->add($email);
        $this->add($phone);         
        $this->add($date);  
        $this->add($request);  

    }
}

                                       
                                           