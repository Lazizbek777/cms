<?php

namespace Publication\Form;

use Application\Form\Element\Image;
use Phalcon\Forms\Element\Check;
use Phalcon\Validation\Validator\PresenceOf;
use Application\Form\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Select;
use \Phalcon\Forms\Element\File;
use Publication\Model\Type;

class PublicationForm extends Form
{

    public function initialize()
    {
        $type = new Select('type_id', Type::cachedListArray(['key' => 'id']));
        $type->setLabel('Тип публикации');
        $this->add($type);

        $title = new Text('title', ['required' => true]);
        $title->addValidator(new PresenceOf([
            'message' => 'Title can not be empty'
        ]));
        $title->setLabel('Заголовок');
        $this->add($title);

        $slug = new Text('slug');
        $slug->setLabel('Ссылка');
        $this->add($slug);

        $date = new Text('date');
        $date->setLabel('Дата публикации');
        $this->add($date);

        $text = new TextArea('text');
        $text->setLabel('Текст');
        $this->add($text);       

        $meta_description = new TextArea('meta_description');
        $meta_description->setLabel('Meta-description');
        $this->add($meta_description); 

        $meta_title = new TextArea('meta_title');
        $meta_title->setLabel('Meta-title');
        $this->add($meta_title);      

        $preview_inner = new Check('preview_inner');
        $preview_inner->setLabel('Показать изображение внутри публикации');
        $this->add($preview_inner);

        $image = new Image('preview_src');
        $image->setLabel('Изображение');
        $this->add($image);

        $index_page = new Check('index_page');
        $index_page->setLabel('Отключить индексацию');
        $this->add($index_page);
    }

} 