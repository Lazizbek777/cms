<?php

namespace Eskiz\Plugin;

use \Phalcon\Mvc\User\Plugin;

class Title extends Plugin
{

    public function __construct($di)
    {
        $helper = $di->get('helper');
        $site_name = \Cms\Model\Settings::findFirst(1);
        if ($site_name) {           
	        if (!$helper->meta()->get('seo-manager')) {
	            $helper->title($site_name->getSiteName());
	        }
	      }  
    }

} 