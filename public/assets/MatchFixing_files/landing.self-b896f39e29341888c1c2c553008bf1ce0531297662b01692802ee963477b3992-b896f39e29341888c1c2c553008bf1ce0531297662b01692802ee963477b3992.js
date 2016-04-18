$(function(){
  $('.landing-next1').on('click', function(){
    $('.landing-about1').removeClass('show');
    $('.landing-about1').addClass('hide');
    $('.landing-about2').addClass('show animated fadeInLeft');
  });
  $('.landing-next2').on('click', function(){

    $('.landing-about2').removeClass('show animated fadeInLeft');
    $('.landing-about3').addClass('show animated fadeInLeft');
  });
  $('.landing-previous1').on('click', function(){
    $('.landing-about2').removeClass('show animated fadeInLeft fadeInRight');
    $('.landing-about1').addClass('show animated fadeInRight');
  });
  $('.landing-previous2').on('click', function(){
    $('.landing-about3').removeClass('show animated fadeInLeft');
    $('.landing-about2').addClass('show animated fadeInRight');
  });
});
