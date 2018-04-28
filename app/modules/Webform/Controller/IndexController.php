<?php

namespace Webform\Controller;

use Application\Mvc\Controller;
use Webform\Model\Webform;
use Phalcon\Mvc\Dispatcher\Exception;
use Phalcon\Http\Response;

class IndexController extends Controller
{

    public function feedbackAction()
    {
       $model = new Webform();

        if ($this->request->isPost()) {
            
            $from = 'info@eskiz.uz';    
            $name = 'Eskiz Media';  

            $mailer = $model->mailconfig($from, $name);   
            
            $params = [ 
                'name' => $this->request->getPost('name'),
                'email' => $this->request->getPost('email'),
                'phone' => $this->request->getPost('phone'),
                'nuntius' => $this->request->getPost('nuntius'),               
                'people' => $this->request->getPost('people'),
            ];

            $viewPath = 'emails/feedback';            

            $message = $mailer->createMessageFromView($viewPath, $params)
                    ->to('logan_9428@mail.ru', 'Обратная связь')
                    ->subject($this->request->getPost('subject'));            
            $message->send(); 

            $this->response->setStatusCode(200, 'OK');          
        }
    }

    public function bookingAction()
    {
        $model = new Webform();

        if ($this->request->isPost()) {
            
            $from = 'info@eskiz.uz';    
            $name = 'Eskiz Media';  

            $mailer = $model->mailconfig($from, $name);   
            
            $params = [ 
                'name' => $this->request->getPost('name'),
                'email' => $this->request->getPost('email'),
                'phone' => $this->request->getPost('phone'),
                'date' => $this->request->getPost('date'),
                'request' => $this->request->getPost('request'),
                'tour' => $this->request->getPost('tour'),
                'people' => $this->request->getPost('people'),
      
            ];

            $viewPath = 'emails/travelBack';            

            $message = $mailer->createMessageFromView($viewPath, $params)
                    ->to('logan_9428@mail.ru', 'Обратная связь')
                    ->subject($this->request->getPost('subject'));            
            $message->send(); 

            $this->response->setStatusCode(200, 'OK');        
        } 
        
    }

    
}
