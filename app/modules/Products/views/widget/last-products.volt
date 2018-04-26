{% if products %}
  {% for item in products %}
  {% set link = helper.langUrl(['for':'product', 'category':item.getCategorySlug(), 'slug':item.getSlug()]) %}
    <div class="col-sm-4">
      <div class="product-image-wrapper">
        <div class="single-products">
          <div class="productinfo text-center">
            <a href="{{ link }}"> 
            <img src="/{{item.getAnons()}} " />  
            {% set image = helper.image([
              'id': item.getId(),
              'type': 'products',
              'width': 350,
              'height': 200,
              'strategy': 'a'
              ]) %}
              {% if imageExists %}
                {{ image.imageHTML() }}
              {% endif %}
              <h3>{{ item.getTitle() }}</h3> 
            </a>           
          </div>
        </div>
      </div>
    </div>
  {% endfor %}
{% endif %}