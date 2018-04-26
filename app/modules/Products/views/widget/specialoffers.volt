{% if products %}
  <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      {% for index, item in products %}
        <div class="item {% if index == 0 %}active{% endif %}"> 
          <div class="col-sm-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center">
                  <a href="{{ link }}">
                  <img src="/{{ item.getAnons() }}"/>
                    {% set image = helper.image([
                      'id': item.getId(),
                      'type': 'products',
                      'width': 350,
                      'height': 220,
                      'strategy': 'a'
                    ]) %}
                    {% set link = helper.langUrl(['for':'product', 'category':item.getCategorySlug(), 'slug':item.getSlug()]) %}
                    {% if imageExists %}
                      {{ image.imageHTML() }}
                    {% endif %}
                    <h2>$ {{ item.getPrice() }}</h2>
                    <p>{{ item.getTitle() }}</p>
                  </a>
                </div>
                
              </div>
            </div>
          </div>
        </div>
      {% endfor %}
    </div>
    <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
      <i class="fa fa-angle-left"></i>
    </a>
    <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
      <i class="fa fa-angle-right"></i>
    </a>      
  </div>
{% endif %}