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
        {% if helper.isAdminSession() %}

          <div class="product-details"><!--product-details-->
            <div class="col-sm-5">
              <div class="view-product">                      
                {% for key, photo in productsGallery %}           
                  <div class="block ">
                    {% if key == 0 %}
                    <img src="/{{photo.getFile()}}">
                    {% endif %}
                    {% set image = helper.image([
                      'id': photo.getFileId(),
                      'type': 'products_gallery',
                      'width': 500,
                      'height': 350,
                      'strategy': 'wh'
                    ]) %}
                  </div>
                {% endfor %}
              </div>
            </div>
            <div class="col-sm-7">
              <div class="product-information">
                <h2>{{ productsResult.title }}</h2>
                {% for field in productsFields %}
                  <p><b>{{field.getTitle()}}:</b> {{field.getText()}}</p>
                {% endfor %}
                <a href=""><img src="/assets/images/product-details/share.png" class="share img-responsive"  alt="" /></a>
              </div><!--/product-information-->
            </div>
            <div class="clearfix"></div>

            <div class="full-text">
              <h3>{{ helper.translate('Description')}}</h3>
              <p>{{ productsResult.text }}</p>
            </div>
          </div><!--/product-details-->
          

          
        {% endif %}

      </div>
    </div>
  </div>
</section>  