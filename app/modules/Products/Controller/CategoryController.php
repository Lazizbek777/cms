<?php


namespace Products\Controller;

use Application\Mvc\Controller;
use Products\Form\CategoryForm;
use Products\Model\Category;
use Menu\Model\Menus;

class CategoryController extends Controller
{

    public function initialize()
    {
        $this->setAdminEnvironment();
    }

    public function indexAction()
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
        
        $this->view->entries = $data;

        $this->helper->title($this->helper->at('Category'), true);
    }

    public function addAction()
    {
        $this->view->pick(array('category/edit'));

        $form = new CategoryForm();
        $model = new Category();

        if ($this->request->isPost()) {
            $post = $this->request->getPost();
            $form->bind($post, $model);

            if ($form->isValid()) {
                if ($model->create()) {
                    $form->bind($post, $model);
                    $model->updateFields($post);
                    if ($model->update()) {
                        $this->menuCheck($model->getId());
                        $this->uploadImage($model);
                        $this->flash->success('Category created');
                        return $this->redirect($this->url->get() . 'products/category/edit/' . $model->getId() . '?lang=' . LANG);
                    } else {
                        $this->flashErrors($model);
                    }
                } else {
                    $this->flashErrors($model);
                }
            } else {
                $this->flashErrors($form);
            }
        }

        $this->view->model = $model;
        $this->view->form = $form;
        $this->helper->title($this->helper->at('Adding category'));
    }

    public function editAction($id)
    {
        $form = new CategoryForm();
        $model = Category::findFirst($id);

        if ($this->request->isPost()) {
            $post = $this->request->getPost();
            $form->bind($post, $model);

            if ($form->isValid()) {
                $model->updateFields($post);
                if ($model->update()) {
                    $this->menuCheck($model->getId());
                    $this->uploadImage($model);
                    $this->flash->success('Category created');
                    return $this->redirect($this->url->get() . 'products/category/edit/' . $model->getId() . '?lang=' . LANG);
                } else {
                    $this->flashErrors($model);
                }
            } else {
                $this->flashErrors($form);
            }
        } else {
            $form->setEntity($model);
        }

        $this->view->model = $model;
        $this->view->form = $form;
        $this->helper->title($this->helper->at('Category'));
    }

    public function deleteAction($id)
    {
        $model = Category::findFirst($id);
        $count = Category::count();
        $slug = 'products/'.$model->getSlug();

        $menus = Menus::findFirst("slug = '".$slug."'");       

        if ($count == 1) {
            $this->flash->error($this->helper->at('Can not Delete the last Category'));
            return;
        }

        if ($this->request->isPost()) {
            if($menus)
              $menus->delete();
            
            $imageFilter = new \Image\Storage([
                'id'   => $model->getId(),
                'type' => 'category',
            ]);
            $imageFilter->remove();            
            $model->delete();
            $this->redirect($this->url->get() . 'products/category');
        }

        $this->view->model = $model;
        $this->helper->title($this->helper->at('Delete category'));
    }

    private function uploadImage($model)
    {
        if ($this->request->isPost()) {
            
            if ($this->request->hasFiles() == true) { 
              $files = $this->request->getUploadedFiles(); 
              
              foreach ($files as $file) { 
                
                if($file->getTempName()){
                    $imageFilter = new \Image\Storage([
                        'id'   => $model->getId(),
                        'type' => 'category',
                    ]);
                    $imageFilter->remove();
                    
                    $image = new \Phalcon\Image\Adapter\GD($file->getTempName());  
                    
                    $image->save($imageFilter->originalAbsPath());

                    $model->setFoto($imageFilter->originalRelPath());
                    $model->update();

                    $this->flash->success($this->helper->at('Image added'));  
                } 
                
              }               
              
            }
        }
    }

    private function menuCheck($id)
    {
      $model = Category::findFirst($id);

      $category_slug = 'products';
      $slug = 'products/'.$model->getSlug();
      
      if($model->getMenuCheck() == 1){
        $category_menus = Menus::findFirst("slug = '".$category_slug."'");          
        $menus = Menus::findFirst("slug = '".$slug."'");   
        if($category_menus){
          if($menus){
            if(!$menus->getTitle()){
              $menus->setTitle($model->getTitle());
              $menus->setStatus(1);
              $menus->save();
            } else {
              $menus->setStatus(1);
              $menus->save();
            }
          } else {
            $menus = new Menus;
            $menus->setRoot('main');
            $menus->setSlug($slug);
            $menus->setDepth(1);
            if ($menus->create()) {
              $menus->setTitle($model->getTitle());
              $menus->setStatus(1);
              $menus->save();
            }
          }   
        } else {
          $category_menus = new Menus;
          $category_menus->setRoot('main');
          $category_menus->setSlug($category_slug);
          $category_menus->setDepth(1);
          if ($category_menus->create()) {
            $category_menus->setTitle($this->helper->at('Products'));
            $category_menus->setStatus(1);
            if($category_menus->save()){
              $menus = new Menus;
              $menus->setRoot('main');
              $menus->setSlug($slug);
              $menus->setDepth(1);
              if ($menus->create()) {
                $menus->setTitle($model->getTitle());
                $menus->setStatus(1);
                $menus->save();
              }
            }
          }
        }       
                 
      }
      if($model->getMenuCheck() == 0){
        $menus = Menus::findFirst("slug = '".$slug."'");          
        if($menus){           
          $menus->setStatus(0);
          $menus->save();           
        }         
      }
    }

} 