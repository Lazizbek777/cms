<section class="section banner-inner">
    <article class="container">
        <h1 class="page-title">{{ title }}</h1>
    </article>
</section>

<section class="section main-content">
    <article class="container">
        {{helper.widget('Breadcrumbs').breadcrumbs()}}
        <div class="publications {{ format }}">

            {% if paginate.total_items > 0 %}
                {% for index, item in paginate.items %}
                    <style>
                    .news-post img {max-width:100%; height:auto; }
                    </style>
                    <div class="col-sm-3">
                        {% set image = helper.image([
                        'id': item.p.getId(),
                        'type': 'products',
                        'width': 350,
                        'height': 200,
                        'strategy': 'a'
                        ]) %}
                        {% set link = helper.langUrl(['for':'tour', 'category':item.t_slug, 'slug':item.p.getSlug()]) %}
                        {% if image.isExists() %}{% set imageExists = true %}{% else %}{% set imageExists = false %}{% endif %}
                        <div class="news-post text-center">
                            {% if imageExists %}
                                {{ image.imageHTML() }}
                            {% endif %}
                            <h4 class="text-uppercase"><a href="{{ link }}">{{ item.title }}</a></h4>
                            <p class="text-danger"><span class="btn btn-danger">{{ item.p.getPrice() }} UZS</span></p>
                        </div>                        
                    </div>
                {% endfor %}
            {% else %}
                <p>{{ helper.translate('Entries not found') }}</p>
            {% endif %}

        </div>

        {% if paginate.total_pages > 1 %}
            <div class="pagination">
                {{ partial('main/pagination', ['paginate':paginate] ) }}
            </div>
        {% endif %}
    </article>
</section>        