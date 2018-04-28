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
					<h2 class="title text-center">{{ title }}</h2>	
					<div>
						{{ text }}
					</div>
				</div><!--features_items-->
			</div>
		</div>
	</div>
</section>