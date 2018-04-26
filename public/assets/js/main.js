jQuery(document).ready(function($){

	// loader
  $(window).load(function(){
  	setTimeout(function(){
  	  $('#loader-wrapper').fadeOut();
  	}, 1000);	      
  });

  $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
		event.preventDefault(); 
		event.stopPropagation(); 
		$(this).parent().siblings().removeClass('open');
		$(this).parent().toggleClass('open');
	});	


  //languages switcher
  var curLang = $('#curLang');
  var selection = $('ul.language-switcher');
  var select = selection.find('li');
  var langDtc = select.find('span').attr('data-lang');
  

  curLang.find('span.title').html(select.find('span').text());
  curLang.addClass(langDtc);
  selection.find('span').addClass('hide');

  curLang.on('click', function (event) {
    event.preventDefault();
    if (curLang.hasClass('active')) {
      curLang.removeClass('active');
      $(this).next().stop().slideUp(200);
    } else {
      curLang.addClass('active');          
      $(this).next().stop().slideDown(200);
    }      
  });

  select.on('click', function (event) {
    curLang.trigger('click');
  }); 

  $('.fancybox').fancybox();

  //Scroll 
	$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
      $('.scrollTop').fadeIn(); 
      $('body').addClass('down');
      $(".header").addClass("fixed");
    } else {
      $('.scrollTop').fadeOut();
      $('body').removeClass('down'); 
      $(".header").removeClass("fixed");         
    }
  });

  $('.scrollTop').click(function () {
      $("html, body").animate({
          scrollTop: 0
      }, 600);
      return false;
  });
 

});