
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
        <h2 class="title text-center"></h2>
        <div class="single-blog-post">
          <h3>{{ publicationResult.title }}</h3>
          <div class="post-meta">
            <ul> 
              {% if publicationResult.p.preview_inner %}
              {% set image = helper.image([
              'id': publicationResult.p.getId(),
              'type': 'publication',
              'width': 800,
              'height': 300,
              'strategy': 'w'
              ]) %}
          {% endif %}
            </ul>
            <span>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-half-o"></i>
            </span>
          </div>

              <div class="image inner">
                  {{ image.imageHTML() }}                       
              </div>
          <p>
            {{ publicationResult.text }}
          </p>
          <!-- <div class="pager-area">
            <ul class="pager pull-right">
              <li><a href="#">Pre</a></li>
              <li><a href="#">Next</a></li>
            </ul>
          </div> -->
        </div>
      </div>
      </div>
    </div>
  </div>
</section>


