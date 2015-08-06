// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .


$(function(){
  var counter = 0;
  $('div#counter').html(counter);
 $(document).foundation( {
  orbit: {
         timer_speed: 4000,
         slide_number: false,
         pause_on_hover: false,
         resume_on_mouseout: true,
         timer: true
     }
 }).foundation('topbar');
 $('#instagram-login').hide().fadeIn(2000)
  $('div#search-api-results form input').css('display', 'none');
  $('div#search-api-results form input#submit-selection').css('display', 'inline-block');
   $('div#search-api-results form img').on("click", function () {
    var clicks = $(this).data('clicks');
    
    if (clicks) {
      counter--;
    
      $('span#counter').html(counter);
      $(this).css('opacity', '1');
      $(this).parent().css('background-image', 'none');
      $(this).hover(function () {$(this).css('background-color', '#EE352A'); });

    }
    else {
   counter++;
      $('span#counter').html(counter);
     $(this).css('opacity', '0.5');
     $(this).parent().css("background-image", "url('https://s3-eu-west-1.amazonaws.com/foodsee/uploads/app_elements/check-mark.png')");
  }
    $(this).data("clicks", !clicks);
    counter;
  });

$('input#search-button').on('click', function () {
  $('div.new-search-content').addClass('animated fadeIn whirly-loader');
  $('div.load-message').fadeIn("slow");
});
  });
