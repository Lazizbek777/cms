<header id="header">
	<div class="header_top"><!--header_top-->
		<div class="container">
			<div class="row">
				{{ helper.blockId('header-top') }}
			</div>
		</div>
	</div><!--/header_top-->
	
	<div class="header-middle"><!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="{{ helper.currentUrl(constant('LANG')) }}"><img src="/assets/images/home/logo.png" alt="" /></a>
					</div>
				</div>
				<div class="col-sm-8">
					{{ helper.widget('Search').search() }}
				</div>
			</div>
		</div>
	</div><!--/header-middle-->

	<div class="header-bottom"><!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">{{ partial('main/menu') }}
				</div>
			</div>
		</div>
	</div><!--/header-bottom-->
</header>