{% if entries %}
  <div class="col-sm-12">
    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        {% for index, item in entries %} 
        <li data-target="#slider-carousel" data-slide-to="0" class="{% if index == 0 %}active{% endif %}"></li>
        {% endfor %}
      </ol>      
      <div class="carousel-inner">  
        {% for index, item in entries %} 
          <div class="item {% if index == 0 %}active{% endif %}">
            <div class="col-sm-6">
              <h1><span>E</span>-SHOPPER</h1>
              <h2>{{ item.getTitle() }}</h2>
              <p>{{ item.getText() }}</p>
              <button type="button" class="btn btn-default get">{{ helper.translate('Get it now') }}</button>
            </div>
            <div class="col-sm-6">
              <img src="/{{ item.getBanner() }}" class="girl img-responsive" alt="{{item.getTitle()}}" />
            </div>
          </div>  
        {% endfor %}        
      </div>      
      <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev"><i class="fa fa-angle-left"></i></a>
      <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next"><i class="fa fa-angle-right"></i></a>
    </div>        
  </div>  
{% endif %}
