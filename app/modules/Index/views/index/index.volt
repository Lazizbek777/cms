{{ helper.widget('Slider').sliderBlock() }}

{{ helper.blockID('slogan') }}

<section class="section dark_bg">
  <article class="container">
  	{{ text }}
		<div class="col-sm-12 form-group">
  		{{ helper.widget('Portfolio').portfolio() }}
  	</div>
  	<div class="col-sm-12 form-group">
  		{{ helper.widget('Reviews').reviews() }}
		</div>
		<div class="col-sm-12 form-group">
  		{{ helper.widget('Products').lastProducts() }}
		</div>
  	<div class="col-sm-12 form-group">
  		{{ helper.widget('Products').specialoffers() }}
		</div>
  	<div class="col-sm-12 form-group">
  		{{ helper.widget('Poll').poll() }}
  	</div>	
  </article> 
</section>

<aside class="sidebar">
	{{ helper.widget('Publication').lastNews() }}
</aside>