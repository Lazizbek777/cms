<section>
  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        <div class="left-sidebar">
          <h2>{{ helper.translate('Category') }}</h2>
          <div class="panel-group category-products" id="accordian">
            {{ helper.widget('Products').categories() }}          
          </div>
          <div class="shipping text-center">
            <img src="/assets/images/home/shipping.jpg" alt="" />
          </div>  
        </div>
      </div>
      
      <div class="col-sm-9">
        <div class="blog-post-area">
          <h2 class="title text-center"> {{ title }}</h2>         
          <div class="ingle-blog-post {{ format }}">            
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
                        {% set link = helper.langUrl(['for':'product', 'category':item.t_slug, 'slug':item.p.getSlug()]) %}
                        {% if image.isExists() %}{% set imageExists = true %}{% else %}{% set imageExists = false %}{% endif %}
                        <div class="news-post text-center">
                            {% if imageExists %}
                                {{ image.imageHTML() }}
                            {% endif %}
                            <h4 class="text-uppercase"><a href="{{ link }}">{{ item.title }}</a></h4>
                        </div>                        
                    </div>
                {% endfor %}
            {% else %}
                <p>{{ helper.translate('Entries not found') }}</p>
            {% endif %}
          </div> 
        </div>
      </div>
    </div>
  </div>
</section>

  