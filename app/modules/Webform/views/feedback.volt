<div id="feedback-content">
  <div class="feedback-form">
    <form class="contact-form row" action="/webform/feedback" id="main-contact-form" name="contact-form" method="post">
            <div class="col-sm-6 form-group">
        {{ form.renderDecorated('name') }}
      </div>  
      <div class="col-sm-6 form-group">
        {{ form.renderDecorated('email') }}
      </div>
       <div class="col-sm-12 form-group">
        {{ form.renderDecorated('subject') }}
      </div>
      <div class="col-sm-12 form-group">
        {{ form.renderDecorated('message') }}
      </div>
      <div class="form-group col-sm-12 ">
        <input type="submit" name="submit" class="btn btn-primary pull-right" value="{{helper.translate('Submit')}}">
      </div>
      <div class="wpcf7-response-output wpcf7-display-none"></div>
    </form>
  </div>
  <div class="ajax-loader"></div>
</div>
       

<script>
  $(document).ready(function() {
    var formContent = $('#feedback-content'); 
    var formID = formContent.find('form');  

    $('input#files').change(function(){    
      var fileValidate = $(this).val(); 
      var extension = fileValidate.replace(/^.*\./, '');
      var fileExtension = ['jpeg', 'jpg', 'png', 'pdf', 'bmp'];
      if ($.inArray(extension.toLowerCase(), fileExtension) == -1) {
        $(this).parent().parent().removeClass('has-success');
        $(this).parent().parent().addClass('has-warning');
        $(this).val('');
      }
      else {
        $(this).parent().parent().removeClass('has-warning');
        $(this).parent().parent().addClass('has-success');
      }
    })   

    formID.submit(function() {
      $('.ajax-loader').show();
      $(this).ajaxSubmit({     
        success: function() { 
          formContent.fadeOut('slow', function(){
            $('.ajax-loader').hide();  
            var message = "{{helper.translate('Email has been send')}}";  
            formContent.fadeIn('slow').html('<div class="alert alert-success">'+message+'</div>');
          }); 
        }
      }); 
      return false; 
    });    
    
  });

  var verifyCallback = function(response) {
    if(response)
      $('.btn-group.send .btn').attr('disabled', false);
  };
    
  var onloadCallback = function() {        
    grecaptcha.render('reCaptcha', {
      'sitekey' : '6Lfy1BcUAAAAAEwZQ3aRwljSvfSaw7sZAT25zAo9',
      'callback' : verifyCallback,
      'theme' : 'light'
    });
  };
</script>

<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
  async defer>
</script>