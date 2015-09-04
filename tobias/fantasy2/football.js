$(document).ready(function() {
   $('.img-1').mouseenter(function() {
       $(this).animate({
           height: '+=10px'
       });
   });
   $('.img-1').mouseleave(function() {
       $(this).animate({
           height: '-=10px'
       }); 
   });
  


