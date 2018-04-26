<?php

namespace Poll\Controller;

use Application\Mvc\Controller;
use Poll\Model\Poll;
use Poll\Model\Votes;
use Poll\Model\Options;

class IndexController extends Controller
{

    public function indexAction()
    {
        $this->view->entries = Poll::find();        
        $this->helper->title($this->helper->translate('Poll'), true);
        $this->helper->meta()->set('description', $this->helper->translate('Poll'));
    }

    public function voteAction()
    {
        if ($this->request->isPost()) {
          $poll_id = $this->request->getPost('poll_id');
      		$vote = $this->request->getPost('vote');

          $model = new Votes();
          $model->setPollId($poll_id);
          $model->setVote($vote);
          $model->setLanguage(LANG);
          if ($model->create()) {             
            $this->returnJSON([
              'success' => true,
              'id' => $model->getPollId(),
            ]);
          } else {
            $this->returnJSON(['error' => implode(' | ', $model->getMessages())]);
          }            
        }    
    }

    public function resultAction($id) {
      if ($id) {         
        $poll_title = Poll::findFirst($id);
        $polls_count = Votes::count([
          "poll_id = :poll_id: AND language = :language:",
          "bind" => [
              "poll_id" => $id,
              "language" => LANG
          ],
          "group" => "vote",
        ]);
        $polls = Options::find([
          "poll_id = :poll_id: AND language = :language:",
          "bind" => [
              "poll_id" => $id,
              "language" => LANG
          ]
        ]);
        $rows = array();        
        foreach ($polls as $poll) {          
          $total = 0;
          $row = array();                
          $row['vote'] = 0;
          foreach ($polls_count as $item) {
            $total += (int)$item->rowcount;
            if($item->vote == $poll->vote){
              $row['vote'] = (int)$item->rowcount;
            }  
            $row['title'] = $poll->title;              
          } 
          $rows[] = $row;                  
        }
        $this->returnJSON([
          'success' => true,
          'title' => $poll_title->getTitle(),
          'data' => $rows,
          'total' => $total,
        ]);                    
      }    
    }

}
