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

specialties = {};

specialties.limitChosenSpecialities = function(){
    $('.specialities_checkboxes').click(function(){
        var specialty = $(this);
        specialty.attr("checked", true);
        if ($('.specialities_checkboxes:checked').length > 3){
            specialty.attr("checked", false);
            $(".specialties_checkboxes").not(':checked').attr('disabled', true);
            alert("You can't have it all. Only 3 specialties can be chosen!");
        } else {
            $(".specialties_checkboxes").removeAttr("disabled");
        }
    });
};


$(document).ready(function(){
    $('.btn-rate-player').click()
    $('.star_rating').click(function(){
        var star = $(this);
        var form_id = star.attr('data-form-id');
        var stars = star.attr('data-stars');
        ratingsSection.setStars(form_id, stars);
        $('#' + form_id + '_stars').val(stars);
        $.ajax({
            method: 'POST',
            url: $('#' + form_id).attr('action'),
            data: $('#' + form_id).serialize()
        }).success(function(){
            $('#ratings_form').html('');
            $('#ratings_form').append("<p>Rated</p>");
        });
    });

    $('.star_rating_form').each(function(){
        var form_id = $(this).attr('id');
        var stars = $('#' + form_id + '_stars').val();
        ratingsSection.setStars(form_id, stars)
    });

    specialties.limitChosenSpecialities();
});


// TO BE REFACTORED!!!