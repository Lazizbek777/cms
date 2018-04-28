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
          <h2 class="title text-center">{{ helper.translate('Latest news')}}</h2>
          <div class="ingle-blog-post {{ format }}">
            {% if paginate.total_items > 0 %}
              {% for index, item in paginate.items %}
              {% set url = helper.langUrl([
                'for':'publication',
                'type':item.t_slug,
                'slug':item.p.getSlug()
                ]) %}
                {% set image = helper.image([
                'id':item.p.getId(),
                'type':'publication',
                'width': 600,
                'height': 400,
                'strategy': 'w'
                ],[
                'alt':item.title|escape_attr
                ]) %}
                <div class="single-blog-post">
                  <h3>{{ item.title }}</h3>
                  <div class="post-meta">
                    <ul>
                      <li><i class="fa fa-user"></i> Mac Doe</li>
                      <li><i class="fa fa-clock-o"></i> {{ item.p.getDate('h:i:s') }}</li>
                      <li><i class="fa fa-calendar"></i> {{ item.p.getDate('d.m.Y') }}</li>
                    </ul>
                    <span>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star-half-o"></i>
                    </span>
                  </div>
                  <a href="{{ url }}" title="{{ item.title|escape_attr }}" class="image" rel="nofollow">
                    {% if image.isExists() %}
                      {{ image.imageHTML() }}
                    {% endif %}
                  </a>
                  <p>{{ helper.announce(item.text, 250) }}</p>
                  <a  class="btn btn-primary" href="{{ url }}">{{ helper.translate('Read More')}}</a>
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

  