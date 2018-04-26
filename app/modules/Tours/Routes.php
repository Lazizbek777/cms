<?php

namespace Tours;

use Tours\Model\Tours;
use Tours\Model\Tcategory;
use Tours\Model\Country;

class Routes
{

    public function init($router)
    {
        $category_keys = array_keys(Tcategory::category());
        $category_regex = '(' . implode('|', $category_keys) . ')';
        $country_keys = array_keys(Country::country());
        $country_regex = '(' . implode('|', $country_keys) . ')';
       
        $router->add('/tours/admin/{category:' . $category_regex . '}', array(
            'module' => 'tours',
            'controller' => 'admin',
            'action' => 'index'
        ))->setName('tours_admin');

        $router->add('/tours/admin/{category:' . $category_regex . '}/([a-zA-Z0-9_]+)', array(
            'module' => 'tours',
            'controller' => 'admin',
            'action' => 2
        ))->setName('tours_admin_action');        

        $router->addML('/tours', array(
            'module' => 'tours',
            'controller' => 'index',
            'action' => 'tours'
        ), 'tour-category');

        $router->addML('/tours/{category:' . $category_regex . '}', array(
            'module' => 'tours',
            'controller' => 'index',
            'action' => 'index'
        ), 'tours');

        $router->addML('/tours/{category:' . $category_regex . '}/{slug:[a-zA-Z0-9_-]+}', array(
            'module' => 'tours',
            'controller' => 'index',
            'action' => 'view'
        ), 'tour');

        $router->addML('/{country:' . $country_regex . '}', array(
            'module' => 'tours',
            'controller' => 'index',
            'action' => 'countries'
        ), 'countries');

        $router->addML('/{country:' . $country_regex . '}/{slug:[a-zA-Z0-9_-]+}', array(
            'module' => 'tours',
            'controller' => 'index',
            'action' => 'country'
        ), 'country');

        return $router;

    }

}