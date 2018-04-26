<?php

namespace Products\Widget;

use Application\Widget\AbstractWidget;
use Products\Model\Products;
use Products\Model\Category;

class ProductsWidget extends AbstractWidget
{

    public function lastProducts($limit = 10)
    {
        $products = Products::query()        
        ->orderBy('created_at DESC')
        ->limit($limit)
        ->execute();        

        $this->widgetPartial('widget/last-products', ['products' => $products]);
    } 


    public function specialoffers($limit = 20)
    {
        $products = Products::query()
        ->where("special_offer = '1'")
        ->orderBy('created_at DESC')
        ->limit($limit)
        ->execute();        

        $this->widgetPartial('widget/specialoffers', ['products' => $products]);
    }  

    public function categories($limit = 20)
    {
        $categories = Category::find('parent_cat = 0');       

        $data = array();        
        foreach ($categories as $id => $value) {                         
          $catData['id'] = $value->id;
          $catData['title'] = $value->getTitle();
          $catData['text'] = $value->getText();
          $catData['meta_description'] = $value->getMetaDescription();
          $catData['limit'] = $value->limit;
          $catData['foto'] = $value->foto;
          $catData['slug'] = $value->slug;

          $catChilds = Category::find('parent_cat = '.$value->id);
          $child_data = array();
          foreach ($catChilds as $i => $item) {           
            $child['id'] = $item->id;
            $child['title'] = $item->getTitle();
            $child['text'] = $item->getText();
            $child['meta_description'] = $item->getMetaDescription();
            $child['limit'] = $item->limit;
            $child['foto'] = $item->foto;
            $child['slug'] = $item->slug; 
            $child_data[] = $child;           
          }    
          $catData['child'] = $child_data;
                                 
          $data[] = $catData;                           
        }                 

        $this->widgetPartial('widget/categories', ['categories' => $data]);
    }    

} 