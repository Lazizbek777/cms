<section id="slider">
	<div class="container">
		<div class="row">
			{{ helper.widget('Slider').sliderBlock() }}
		</div>
	</div>
</section>

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

			<div class="col-sm-9 padding-right">
				<div class="features_items"><!--features_items-->
					<h2 class="title text-center">{{ helper.translate('Features Items')}}</h2>
  					{{ helper.widget('Products').lastProducts() }}
				</div>

  			<!-- {{ helper.widget('Products').categories() }} -->
				
				<div class="recommended_items"><!--recommended_items-->
					<h2 class="title text-center">{{ helper.translate('recommended items') }}</h2>						
					<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
  						{{ helper.widget('Products').specialoffers() }}
						</div>			
					</div>
				</div><!--/recommended_items-->
			</div>

		</div>
	</div>
</section>