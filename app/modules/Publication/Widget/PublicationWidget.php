<?php

namespace Publication\Widget;

use Application\Widget\AbstractWidget;
use Publication\Model\Helper\PublicationHelper;

class PublicationWidget extends AbstractWidget
{

    public function lastNews($limit = 2)
    {
        $publicationHelper = new PublicationHelper();
        $fields = $publicationHelper->translateFieldsSubQuery();

        $columns = ['p.*', 't_slug' => 't.slug'];
        $columns = array_merge($columns, $fields);

        $qb = $this->modelsManager->createBuilder()
            ->columns($columns)
            ->addFrom('Publication\Model\Publication', 'p')
            ->leftJoin('Publication\Model\Type', null, 't')
            ->andWhere('t.slug = :type:', ['type' => 'news'])
            ->andWhere('p.date <= NOW()')
            ->orderBy('p.date DESC')
            ->limit($limit);

        $entries = $qb->getQuery()->execute();

        $this->widgetPartial('widget/last-news', ['entries' => $entries]);
    }

    public function services($limit = 4)
    {
        $publicationHelper = new PublicationHelper();
        $fields = $publicationHelper->translateFieldsSubQuery();

        $columns = ['p.*', 't_slug' => 't.slug'];
        $columns = array_merge($columns, $fields);

        $qb = $this->modelsManager->createBuilder()
            ->columns($columns)
            ->addFrom('Publication\Model\Publication', 'p')
            ->leftJoin('Publication\Model\Type', null, 't')
            ->andWhere('t.slug = :type:', ['type' => 'services'])
            ->andWhere('p.date <= NOW()')
            ->orderBy('p.date DESC')
            ->limit($limit);

        $entries = $qb->getQuery()->execute();

        $this->widgetPartial('widget/services', ['entries' => $entries]);
    }

} 