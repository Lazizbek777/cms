{% if entries %}

<div class="slideshow section">    
{% for item in entries %}     
  <div class="slide">               
    <img src="/{{ item.p.banner }}" alt="{{item.title}}">  
    <div class="bg animated fadeInTop">
      {% if(item.p.view_title == 1) %} <h1>{{ item.title }} {% endif %}</h1>
      <div class="text">{{ item.text }}</div>
    </div>
  </div>
{% endfor %}   
</div>   

<script type="text/javascript" src="/assets/js/slider.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) { 
  var slider = $(".slideshow").bxSlider({
    auto: true,
    startSlide: 0,
    mode: 'fade',
    pager: false,
    onSlideAfter: function (currentSlideNumber, totalSlideQty, currentSlideHtmlObject) {   
      $('.slideshow .slide .bg').removeClass('animated fadeInTop');
      $('.slideshow .slide').eq(currentSlideHtmlObject).find('.bg').addClass('animated fadeInTop');
    },
    onSliderLoad: function () {
      $('.slideshow > .slide').eq(1).find('.bg').addClass('animated fadeInTop');                       
    },
  });
});
</script>

{% endif %}