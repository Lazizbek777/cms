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
        <div class="publications {{ format }}">
          {% if category %}
            {% for index, cat in category %}
              <div class="col-sm-4">
                <div class="product-image-wrapper">
                  <div class="single-products">
                    <div class="productinfo text-center">
                      {% set link = helper.langUrl(['for':'products', 'category':cat.getSlug()]) %}
                      <a href="{{ link }}">
                        <img src="/{{cat.getFoto()}}" alt="" />              
                          {% if imageExists %}
                            {{ image.imageHTML() }}
                          {% endif %}
                        <h4>{{ cat.getTitle() }}</h4>
                      </a>
                    </div>
                  </div>
                  <a  class="btn btn-primary" href="{{ link }}">{{ helper.translate('Read More')}}</a>  
                </div>
              </div> 
            {% endfor %}           
          {% endif %}
        </div>
      </div>
    </div>
  </div>
</section>        