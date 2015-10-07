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
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require moment
//= require bootstrap-datetimepicker
//= require jquery.raty
//= require sweet-alert
//= require_tree .
//= require_self

$(function () {
  $('.datepicker').datepicker();

  $('#datetimepicker1').datetimepicker();

  $('.update-button').on('click', function(){
    swal("Updated");
  });

  $('.close-notice').on('click', function(){
    $('#flash-notice').addClass('hide');
  });

  $('.close-alert').on('click', function(){
    $('#flash-alert').addClass('hide');
  });

//   $("[data-behavior='delete']").on('click', function(event) {
//     event.preventDefault();
//     swal({   title: "Are you sure?",   text: "You will not be able to recover this imaginary file!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes, delete it!",   closeOnConfirm: false }, (function(_this) {
//   return function(confirmed) {
//     if (confirmed) {
//       $.ajax({
//         url: $(_this).attr("href"),
//         dataType: "JSON",
//         method: "DELETE",
//         success: function() {
//           return swal('Deleted!', 'Your imaginary file has been deleted.', 'success');
//         }
//       });
//     } else {
//       swal('Cancelled', 'Your imaginary file is safe :)', 'error');
//     }
//   };
// })(this));
  // });
});
