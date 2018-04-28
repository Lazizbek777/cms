<div id="contact-page" class="container">
  <div class="bg">
    <div class="row">           
      <div class="col-sm-12">                         
        <h2 class="title text-center"><strong>{{ title }}</strong></h2>                                                      
        <div id="gmap" class="contact-map">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d191884.7442778707!2d69.13928099112431!3d41.28277045664322!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38ae8b0cc379e9c3%3A0xa5a9323b4aa5cb98!2z0KLQsNGI0LrQtdC90YIsINCj0LfQsdC10LrQuNGB0YLQsNC9!5e0!3m2!1sru!2s!4v1467978119504" width="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
      </div>                  
    </div>      
    <div class="row">   
      <div class="col-sm-8">
        <div class="contact-form">
          <h2 class="title text-center">{{ helper.translate('Get In Touch')}}</h2>
          <div class="status alert alert-success" style="display: none"></div> 
            {{ flash.output() }}
            {{ helper.widget('Webform').feedback() }}
        </div>
      </div>
      <div class="col-sm-4">
        <div class="contact-info">
          <h2 class="title text-center">{{ helper.translate('Contact Info')}}</h2>
          <address>{{ text }}</address>
          <div class="social-networks">
            <h2 class="title text-center">{{ helper.translate('Social Networking')}}</h2>
            <ul>{{ helper.blockId('social') }}</ul>
          </div>
        </div>
      </div>              
    </div>  
  </div>  
</div>