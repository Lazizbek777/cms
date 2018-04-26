<?php

namespace Tours\Controller;

use Application\Mvc\Controller;
use Tours\Model\Helper\ToursHelper;
use Tours\Model\Tours;
use Phalcon\Exception;
use Tours\Model\Tcategory;
use Tours\Model\Country;
use Cms\Model\Settings;

class IndexController extends Controller
{

    public function toursAction()
    {
        $category = Tcategory::find();       
        $settings = Settings::findFirst(1);
        $curLang = $this->helper->currentUrl(LANG);
        $meta_url = $this->helper->base_url().$curLang.'tours';
        $meta_image = $this->helper->base_url().'/'.$settings->getLogo();

        $this->helper->title()->append($this->helper->at('Tours')); 
        $this->helper->meta()->set('title', $this->helper->at('Tours'));
        $this->helper->meta()->set('description', $this->helper->at('Tours'));
        $this->helper->meta()->set('type', 'article');
        $this->helper->meta()->set('site_name', $settings->getSiteName());
        $this->helper->meta()->set('url', $meta_url);
        $this->helper->meta()->set('image', $meta_image);

        $this->view->title  = $this->helper->at('Tours');
        $this->view->category = $category;
    }

    public function indexAction()
    {
        $category = $this->dispatcher->getParam('category', 'string');
        $categoryModel = Tcategory::getCachedBySlug($category);
        if (!$categoryModel) {
            throw new Exception("Tours hasn't category = '$category''");
        }

        $categoryLimit = ($categoryModel->getLimit()) ? $categoryModel->getLimit() : 10;
        $limit     = $this->request->getQuery('limit', 'string', $categoryLimit);
        if ($limit != 'all') {
            $paginatorLimit = (int)$limit;
        } else {
            $paginatorLimit = 9999;
        }
        $page = $this->request->getQuery('page', 'int', 1);

        $toursHelper = new ToursHelper();
        $fields = $toursHelper->translateFieldsSubQuery();

        $columns = ['p.*', 't_slug' => 't.slug'];
        $columns = array_merge($columns, $fields);

        $qb = $this->modelsManager->createBuilder()
            ->columns($columns)
            ->addFrom('Tours\Model\Tours', 'p')
            ->leftJoin('Tours\Model\Tcategory', null, 't')
            ->andWhere('t.slug = :category:', ['category' => $category])
            ->andWhere('p.created_at <= NOW()')
            ->orderBy('p.created_at DESC');

        $paginator = new \Phalcon\Paginator\Adapter\QueryBuilder([
            "builder"  => $qb,
            "limit" => $paginatorLimit,
            "page"  => $page
        ]);

        $this->view->paginate = $paginator->getPaginate();

        $settings = Settings::findFirst(1);
        $curLang = $this->helper->currentUrl(LANG);
        $meta_url = $this->helper->base_url().$curLang.'tours/'.$category;

        if(!$categoryModel->getFoto())
            $meta_image = $this->helper->base_url().'/'.$settings->getLogo();
        if($categoryModel->getFoto())
            $meta_image = $this->helper->base_url().'/'.$categoryModel->getFoto();
       
        if(!$categoryModel->getMetaTitle()){
            $this->helper->title()->append($categoryModel->getTitle());
            $this->helper->meta()->set('title', $categoryModel->getTitle());
        }
        if($categoryModel->getMetaTitle()){
            $this->helper->title()->append($categoryModel->getMetaTitle());
            $this->helper->meta()->set('title', $categoryModel->getMetaTitle());
        }

        $this->helper->meta()->set('description', $categoryModel->getMetaDescription());
        $this->helper->meta()->set('type', 'article');
        $this->helper->meta()->set('site_name', $settings->getSiteName());
        $this->helper->meta()->set('url', $meta_url);
        $this->helper->meta()->set('image', $meta_image);

        if($categoryModel->getIndexPage() == 1)        
            $this->helper->meta()->set('robots', 'noindex, nofollow');

        if ($page > 1) {
            $this->helper->title()->append($this->helper->translate('Страница №') . ' ' . $page);
        }
        $this->view->title  = $categoryModel->getTitle();
        $this->view->category = $category;
        $this->helper->menu->setActive($category);
    }

    public function viewAction()
    {
        $slug = $this->dispatcher->getParam('slug', 'string');
        $category = $this->dispatcher->getParam('category', 'string');

        $toursHelper = new ToursHelper();
        $toursResult = $toursHelper->toursBySlug($slug);
        if (!$toursResult) {
            throw new Exception("Tour '$slug.html' not found");
        }
        if ($toursResult->p->getCategorySlug() != $category) {
            throw new Exception("Tour category <> $category");
        }

        $settings = Settings::findFirst(1);
        $curLang = $this->helper->currentUrl(LANG);
        $meta_url = $this->helper->base_url().$curLang.'tours/'.$category.'/'.$slug;
        $meta_image = $this->helper->base_url().'/'.$toursResult->p->anons;

        if(!$toursResult->meta_title){
            $this->helper->title()->append($toursResult->title);
            $this->helper->meta()->set('title', $toursResult->title);
        }
        if($toursResult->meta_title){
            $this->helper->title()->append($toursResult->meta_title);
            $this->helper->meta()->set('title', $toursResult->meta_title);
        }

        $this->helper->meta()->set('description', $toursResult->meta_description);
        $this->helper->meta()->set('type', 'article');
        $this->helper->meta()->set('site_name', $settings->getSiteName());
        $this->helper->meta()->set('url', $meta_url);
        $this->helper->meta()->set('image', $meta_image);

        if($toursResult->p->index_page == 1)        
            $this->helper->meta()->set('robots', 'noindex, nofollow'); 

        $this->helper->menu->setActive($category);

        $this->view->toursResult = $toursResult;
        $this->view->toursGallery = $toursResult->p->photos;
        $this->view->toursFields = $toursResult->p->timetable;
    }

}
