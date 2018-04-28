<?php

namespace Webform\Form;

use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\TextArea;
use Application\Form\Form;
use Phalcon\Validation\Validator\PresenceOf;

class FeedbackForm extends Form
{

  public function initialize()
  {
    $name = new Text("name", ['required' => true, 'class' => 'form-control', 'placeholder' => "Имя"]);
    $email = new Email("email", ['required' => true, 'class' => 'form-control', 'placeholder' => 'Email']);
    $subject = new Text("subject", ['required' => true, 'class' => 'form-control',  'placeholder' => 'Предмет']);     
    $message = new TextArea("message", ['required' => false ,'class' => 'form-control', 'placeholder' => 'Ваше сообщение здесь']);

    $this->add($name);
    $this->add($email);
    $this->add($subject);         
    $this->add($message);  

  }
}

                                           