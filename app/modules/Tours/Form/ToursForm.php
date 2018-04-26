<?php

namespace Tours\Form;

use Application\Form\Element\Image;
use Application\Form\Element\Images;
use Phalcon\Forms\Element\Check;
use Phalcon\Validation\Validator\PresenceOf;
use Application\Form\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Select;
use \Phalcon\Forms\Element\File;
use Tours\Model\Tcategory;
use Tours\Model\Country;

class ToursForm extends Form
{

    public function initialize()
    {
        $category = new Select('category_id', Tcategory::cachedListArray(['key' => 'id']));
        $category->setLabel('Категория');
        $this->add($category);

        $country = new Select('country_id', Country::cachedListArray(['key' => 'id']));
        $country->setLabel('Страны');
        $this->add($country);

        $title = new Text('title', ['required' => true]);
        $title->addValidator(new PresenceOf([
            'message' => 'Title can not be empty'
        ]));
        $title->setLabel('Заголовок');
        $this->add($title);

        $slug = new Text('slug', ['required' => true]);
        $slug->setLabel('Ссылка');
        $this->add($slug);       

        $text = new TextArea('text');
        $text->setLabel('Текст');
        $this->add($text);       

        $price = new Numeric("price", ['value' => 0]);
        $price->setLabel('Цена');
        $this->add($price);

        $duration = new Text('duration', ['required' => true]);
        $duration->setLabel('Продолжительность');
        $this->add($duration);

        $special_offer = new Check('special_offer');
        $special_offer->setLabel('Спецпредложение');
        $this->add($special_offer);

        $top_tour = new Check('top_tour');
        $top_tour->setLabel('Горячие туры');
        $this->add($top_tour);

        $meta_description = new TextArea('meta_description');
        $meta_description->setLabel('Meta-description');
        $this->add($meta_description);

        $meta_title = new TextArea('meta_title');
        $meta_title->setLabel('Meta-title');
        $this->add($meta_title);

        $image = new Image('anons', ['required' => true]);
        $image->setLabel('Изображение');
        $this->add($image);

        $photos = new Images('photos');
        $photos->setLabel('Фотографии');
        $this->add($photos);

        $index_page = new Check('index_page');
        $index_page->setLabel('Отключить индексацию');
        $this->add($index_page);
    }

} 