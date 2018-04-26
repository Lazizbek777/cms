<?php

namespace Products\Controller;

use Application\Mvc\Controller;
use Products\Model\Helper\ProductsHelper;
use Products\Model\Products;
use Phalcon\Exception;
use Products\Model\Category;
use Cms\Model\Settings;

class IndexController extends Controller
{

    public function productsAction()
    {
        $category = Category::find();
        $products = Products::find();
        $settings = Settings::findFirst(1);
        $curLang = $this->helper->currentUrl(LANG);
        $meta_url = $this->helper->base_url().$curLang.'products';
        $meta_image = $this->helper->base_url().'/'.$settings->getLogo();
        
        $this->helper->title()->append($this->helper->at('Products'));
        $this->helper->meta()->set('title', $this->helper->at('Products'));
        $this->helper->meta()->set('description', $this->helper->at('Products'));
        $this->helper->meta()->set('type', 'article');
        $this->helper->meta()->set('site_name', $settings->getSiteName());
        $this->helper->meta()->set('url', $meta_url);
        $this->helper->meta()->set('image', $meta_image);

        $this->view->title  = $this->helper->at('Products');
        $this->view->category = $category;
        $this->view->products = $products;
    }

    public function indexAction()
    {
        $category = $this->dispatcher->getParam('category', 'string');
        $categoryModel = Category::getCachedBySlug($category);
        if (!$categoryModel) {
            throw new Exception("Products hasn't category = '$category''");
        }        

        $categoryLimit = ($categoryModel->getLimit()) ? $categoryModel->getLimit() : 10;
        $limit     = $this->request->getQuery('limit', 'string', $categoryLimit);
        if ($limit != 'all') {
            $paginatorLimit = (int)$limit;
        } else {
            $paginatorLimit = 9999;
        }
        $page = $this->request->getQuery('page', 'int', 1);

        $productsHelper = new ProductsHelper();
        $fields = $productsHelper->translateFieldsSubQuery();

        $columns = ['p.*', 't_slug' => 't.slug'];
        $columns = array_merge($columns, $fields);

        $qb = $this->modelsManager->createBuilder()
            ->columns($columns)
            ->addFrom('Products\Model\Products', 'p')
            ->leftJoin('Products\Model\Category', null, 't')
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
        $meta_url = $this->helper->base_url().$curLang.'products/'.$categoryModel->getSlug();

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

        $productsHelper = new ProductsHelper();
        $productsResult = $productsHelper->productsBySlug($slug);
        if (!$productsResult) {
            throw new Exception("Product '$slug.html' not found");
        }
        if ($productsResult->p->getCategorySlug() != $category) {
            throw new Exception("Product category <> $category");
        }
        
        $settings = Settings::findFirst(1);
        $curLang = $this->helper->currentUrl(LANG);
        $meta_url = $this->helper->base_url().$curLang.'products/'.$category.'/'.$slug;
        $meta_image = $this->helper->base_url().'/'.$productsResult->p->anons;

        if(!$productsResult->meta_title){
            $this->helper->title()->append($productsResult->title);
            $this->helper->meta()->set('title', $productsResult->title);
        }
        if($productsResult->meta_title){
            $this->helper->title()->append($productsResult->meta_title);
            $this->helper->meta()->set('title', $productsResult->meta_title);
        }

        $this->helper->meta()->set('description', $productsResult->meta_description);
        $this->helper->meta()->set('type', 'article');
        $this->helper->meta()->set('site_name', $settings->getSiteName());
        $this->helper->meta()->set('url', $meta_url);
        $this->helper->meta()->set('image', $meta_image);

        if($productsResult->p->index_page == 1)        
            $this->helper->meta()->set('robots', 'noindex, nofollow'); 

        $this->helper->menu->setActive($category);

        $this->view->productsResult = $productsResult;
        $this->view->productsGallery = $productsResult->p->photos;
        $this->view->productsFields = $productsResult->p->additional;
    }

}
