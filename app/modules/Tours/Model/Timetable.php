<?php

namespace Tours\Model;

use Application\Mvc\Model\Model;

class Timetable extends Model
{

    public function getSource()
    {
        return "tours_timetable";
    }
   

    public $id;
    public $tour_id;
    public $title; 
    public $day; 
    public $text; 
    public $language; 

    public function initialize()
    {
        $this->belongsTo('tour_id', 'Tours\Model\Tours', 'id');
    }    

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    } 


    /**
     * @param mixed $id
     */
    public function setTourId($tour_id)
    {
        $this->tour_id = $tour_id;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getTourId()
    {
        return $this->tour_id;
    }    

    /**
     * @param mixed $title
     */
    public function setTitle($title)
    {        
        $this->title = $title;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
    }         

    /**
     * @param mixed $text
     */
    public function setDay($day)
    {        
        $this->day = $day;
        return $this;
    }  

    /**
     * @return mixed
     */
    public function getDay()
    {
        return $this->day;
    }

    /**
     * @param mixed $text
     */
    public function setText($text)
    {        
        $this->text = $text;
        return $this;
    }  

    /**
     * @return mixed
     */
    public function getText()
    {
        return $this->text;
    }

    /**
     * @param mixed $text
     */
    public function setLanguage($language)
    {               
        $this->language = $language;
        return $this;
    }  

    /**
     * @return mixed
     */
    public function getLanguage()
    {
        return $this->language;
    }

}
