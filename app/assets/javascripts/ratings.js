ratingsSection = {};

ratingsSection.setStars = function(form_id, stars){
    for(i=1; i<=5; i++){
        if(i<=stars){
            $('#' + form_id + '_' + i).attr("src", "/assets/star-on.png");
        } else {
            $('#' + form_id + '_' + i).attr("src", "/assets/star-off.png");
        }
    }
};


$(document).ready(function(){
    $('.star_rating').click(function(){
        var star = $(this);
        var form_id = star.attr('data-form-id');
        var stars = star.attr('data-stars');
        var object_name = $(".object-name").text()
        ratingsSection.setStars(form_id, stars);
        $('#' + form_id + '_stars').val(stars);
        $.ajax({
            method: 'POST',
            url: $('#' + form_id).attr('action'),
            data: $('#' + form_id).serialize()
        }).success(function(){
            $('#ratings_form').html('');
            $('#ratings_form').append("<p> You've rated " + object_name + "</p>");
        });
    });

    $('.star_rating_form').each(function(){
        var form_id = $(this).attr('id');
        var stars = $('#' + form_id + '_stars').val();
        ratingsSection.setStars(form_id, stars)
    });
});


// TO BE REFACTORED!!!