<?php

namespace Api;

class Routes
{

    public function init($router)
    {

        $router->add('/api/page/{pageId:[0-9_-]+}', array(
            'module'     => 'api',
            'controller' => 'page',
            'action'     => 'get',
        ))->setName('get');

        $router->add('/api/page', array(
            'module'     => 'api',
            'controller' => 'page',
            'action'     => 'list',
        ))->setName('list');

        return $router;
    }
}
