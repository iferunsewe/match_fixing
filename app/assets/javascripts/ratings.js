ratingsSection = {};


ratingsSection.changeStarImage = function(form_id, stars){
    for(i=1; i<=5; i++){
        if(i<=stars){
            $('#' + form_id + '_' + i).attr("src", "/assets/star-on.png");
        } else {
            $('#' + form_id + '_' + i).attr("src", "/assets/star-off.png");
        }
    }
};

ratingsSection.changeStarHover = function(){
    $('.star_rating').hover(function(){
        var star = $(this);
        var stars = star.attr('data-stars');
        var form_id = star.attr('data-form-id');
        ratingsSection.changeStarImage(form_id, stars);
    }, function(){
        var star = $(this);
        var stars = star.attr('data-stars');
        var form_id = star.attr('data-form-id');
        ratingsSection.changeStarImage(form_id, stars);
    })
};

ratingsSection.sendStarsToDb = function(){
    $('.star_rating').click(function(){
        var star = $(this);
        var form_id = star.attr('data-form-id');
        var stars = star.attr('data-stars');
        var htmlIdForm = $('#' + form_id);
        var htmlIdRatingsForm = $('#ratings_form');
        ratingsSection.changeStarImage(form_id, stars);
        $('#' + form_id + '_stars').val(stars);
        $.ajax({
            method: 'POST',
            url: htmlIdForm.attr('action'),
            data: htmlIdForm.serialize()
        }).success(function(){
            htmlIdRatingsForm.html('');
            htmlIdRatingsForm.append("<p>Rated</p>");
        });
    });
};

ratingsSection.setStars = function(){
    $('.star_rating_form').each(function(){
        var rails_form_id = $(this).attr('id');
        var stars_value = $('#' + rails_form_id + '_stars').val();
        ratingsSection.changeStarImage(rails_form_id, stars_value)
    });
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
    $('.btn-rate-player').click();

    ratingsSection.changeStarHover();

    ratingsSection.sendStarsToDb();

    ratingsSection.setStars();

    specialties.limitChosenSpecialities();

});


// TO BE REFACTORED!!!