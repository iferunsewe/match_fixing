$( document ).ready(function() {

    // hide spinner
    $(".spinner").hide();


    // show spinner on AJAX start
    $(document).ajaxStart(function(){
        $(".spinner").show();
    });

    // hide spinner on AJAX stop
    $(document).ajaxStop(function(){
        $(".spinner").delay(1000).hide(0);
    });

});