<?php

namespace Tours\Model;

use Application\Mvc\Model\Model;


class Gallery extends Model
{

    public function getSource()
    {
        return "tours_photos";
    }

    private $id;
    private $tour_id;
    private $file;
    private $file_id;

    public function initialize()
    {
        $this->belongsTo('tour_id', 'Tours\Model\Tours', 'id');
    }
   
        
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setTourId($tour_id)
    {
        $this->tour_id = $tour_id;
        return $this;
    }

    public function getTourId()
    {
        return $this->tour_id;
    }    

    public function getFile()
    {
        return $this->file;
    }

    public function setFile($file)
    {
        $this->file = $file;
        return $this;
    }

    public function getFileId()
    {
        return $this->file_id;
    }

    public function setFileId($file_id)
    {
        $this->file_id = $file_id;
        return $this;
    }
    

}
