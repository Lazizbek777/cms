<?php

namespace Tours\Widget;

use Application\Widget\AbstractWidget;
use Tours\Model\Tours;

class ToursWidget extends AbstractWidget
{

    public function lastProducts($limit = 10)
    {
        $tours = Tours::query()        
        ->orderBy('created_at DESC')
        ->limit($limit)
        ->execute();        

        $this->widgetPartial('widget/last-tours', ['tours' => $Tours]);
    } 


    public function specialoffers($limit = 10)
    {
        $tours = Tours::query()
        ->where("special_offer = '1'")
        ->orderBy('created_at DESC')
        ->limit($limit)
        ->execute();        

        $this->widgetPartial('widget/specialoffers', ['tours' => $tours]);
    }    

} 