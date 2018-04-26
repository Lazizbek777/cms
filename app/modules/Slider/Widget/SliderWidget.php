<?php

namespace Slider\Widget;

use Application\Widget\AbstractWidget;
use Slider\Model\Helper\SliderHelper;

class SliderWidget extends AbstractWidget
{

    public function sliderBlock($limit = 5)
    {
        $SliderHelper = new SliderHelper();
        $fields = $SliderHelper->translateFieldsSubQuery();

        $columns = ['p.*'];
        $columns = array_merge($columns, $fields);

        $qb = $this->modelsManager->createBuilder()
            ->columns($columns)
            ->addFrom('Slider\Model\Slider', 'p')
            ->orderBy('p.id DESC')
            ->limit($limit);

        $entries = $qb->getQuery()->execute();

        $this->widgetPartial('widget/slider-block', ['entries' => $entries]);
    }

} 