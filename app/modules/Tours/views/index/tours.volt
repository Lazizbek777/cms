<section class="section banner-inner">
    <article class="container">
        <h1 class="page-title">{{ title }}</h1>
    </article>
</section>

<section class="section main-content">
    <article class="container">
        {{helper.widget('Breadcrumbs').breadcrumbs()}}

        <div class="publications {{ format }}">

            {% if category %}
                {% for index, cat in category %}
                    <h2>{{cat.getTitle()}}</h2>
                    {% set link = helper.langUrl(['for':'tours', 'category':cat.getSlug()]) %}                    
                    <p><img src="/{{cat.getFoto()}}" class="img-responsive" /></p>
                    <p>{{cat.getText()}}</p>
                    <p><a href="{{link}}" class="btn btn-success">Подробнее</a></p>
                {% endfor %}           
            {% endif %}
        </div>
        
    </article>
</section>        