<section class="section banner-inner">
    <article class="container">
        <h1 class="page-title">{{ toursResult.title }}</h1>
    </article>
</section>

<section class="section main-content">
    <article class="container">

    {{ helper.widget('Breadcrumbs').breadcrumbs('tours', 'category') }}

        {% if helper.isAdminSession() %}
            <p style="font-weight: bold;font-size:120%;">
                <a class="noajax"
                   href="{{ url.get() }}products/admin/edit/{{ toursResult.p.getId() }}?lang={{ constant('LANG') }}">{{ helper.at('Edit tour') }}</a>
            </p>
        {% endif %}    
        <div class="col-sm-6">
            <ul class="list-inline">
            
            {% for key, photo in toursGallery %}           
            {% if key == 0 %}
                <img src="/{{photo.getFile()}}" class="img-responsive">
            {% endif %}
            {% set image = helper.image([
            'id': photo.getFileId(),
            'type': 'tours_gallery',
            'width': 200,
            'height': 150,
            'strategy': 'wh'
            ]) %}
                <li>
                    <a href="/{{photo.getFile()}}" class="fancybox" data-fancybox-group="gallery">{% if image.isExists() %}{{ image.imageHTML() }}{% endif %}</a>
                </li>   
            {% endfor %}
            </ul>
        </div>
        <div class="col-sm-6">
            <h2>{{ toursResult.title }}</h2>
            <h3 class="text-danger">{{ toursResult.p.getPrice() }} UZS</h3>
            <dl class="dl-horizontal">
            {% for field in toursFields %}
                <dt>{{field.getTitle()}}:</dt>
                <dd><strong>{{field.getDay()}} - </strong> {{field.getText()}}</dd>                
            {% endfor %}
            </dl>
            <div class="full-text">{{ toursResult.text }}</div>
            
            <a href="{{ helper.langUrl(['for':'tours','category':toursResult.t_slug]) }}" class="back">&larr; {{ helper.translate('Back to tours list') }}</a>
        </div>
    

    
    </article>
</section> 