<?php


namespace Tours\Controller;

use Application\Mvc\Controller;
use Tours\Form\CountryForm;
use Tours\Model\Country;

class CountryController extends Controller
{

    public function initialize()
    {
        $this->setAdminEnvironment();
    }

    public function indexAction()
    {
        $this->view->entries = Country::find();

        $this->helper->title($this->helper->at('Country'), true);
    }

    public function addAction()
    {
        $this->view->pick(array('country/edit'));

        $form = new CountryForm();
        $model = new Country();

        if ($this->request->isPost()) {
            $post = $this->request->getPost();
            $form->bind($post, $model);

            if ($form->isValid()) {
                if ($model->create()) {
                    $form->bind($post, $model);
                    $model->updateFields($post);
                    if ($model->update()) {
                        $this->flash->success('Country created');
                        return $this->redirect($this->url->get() . 'tours/country/edit/' . $model->getId() . '?lang=' . LANG);
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
        $this->helper->title($this->helper->at('Adding country'));
    }

    public function editAction($id)
    {
        $form = new CountryForm();
        $model = Country::findFirst($id);

        if ($this->request->isPost()) {
            $post = $this->request->getPost();
            $form->bind($post, $model);

            if ($form->isValid()) {
                $model->updateFields($post);
                if ($model->update()) {
                    $this->flash->success('Country created');
                    return $this->redirect($this->url->get() . 'tours/country/edit/' . $model->getId() . '?lang=' . LANG);
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
        $this->helper->title($this->helper->at('Country'));
    }

    public function deleteAction($id)
    {
        $model = Country::findFirst($id);
        $count = Country::count();
        if ($count == 1) {
            $this->flash->error($this->helper->at('Can not Delete the last Country'));
            return;
        }      
        
        $this->view->model = $model;
        $this->helper->title($this->helper->at('Delete country'));
    }    
} 