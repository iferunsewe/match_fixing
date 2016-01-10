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

matches = {};
matches.editFormFields = function(){
    $('#players-stats-selector').change(function(){
        $('.hidden-option-stats').hide();
        var selectedPlayer = $(this).val();
        $('#stat_form' + selectedPlayer).show();
    });
};

leagues = {};
leagues.editResults = function(){
    $('.input-score').hide();
    $('.scores-submit-button').hide();
    $('.input-scores-button').click(function(){
        var matchIdForm = $(this).attr('data_match_form_id');
        var htmlIdForm = $('#' + matchIdForm);
        var matchId = htmlIdForm.attr('data_match_id');
        var score_inputs = $(this).attr('data_scores_match_id');
        $(".input_" + score_inputs + "").show();
        console.log('#scores-submit-button-' + matchId);
        $("." + score_inputs).hide();
        $(this).hide();
        $('#scores-submit-button-' + matchId).show();
    })
};

leagues.submitResults = function(){
    $('.scores-submit-button').click(function(){
        var matchIdForm = $(this).attr('data_match_form_id');
        var htmlIdForm = $('#' + matchIdForm);
        var matchId = htmlIdForm.attr('data_match_id');
        $.ajax({
            type: "POST",
            url: htmlIdForm.attr('action'),
            data: htmlIdForm.serialize()
        }).success(function(){
            console.log("Match data submitted");
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "/matches/" + matchId,
            }).success(function(data){
                var input_scores_button = $('.input-scores-button');
                var scores = $('.' + input_scores_button.attr('data_scores_match_id'));
                var team_a_score_element = $('#team_a_score_' + matchId);
                var team_b_score_element = $('#team_b_score_' + matchId);
                var team_a_score = data['team_a_score']
                var team_b_score = data['team_b_score']
                team_a_score_element.html('').append(team_a_score);
                team_b_score_element.html('').append(team_b_score);
                input_scores_button.show();
                $('.score').show();
                $('.input-score').hide();
                $('.scores-submit-button').hide();
                scores.show()
            });
        });
    })
};



$(document).ready(function(){
    $('.btn-rate-player').click();

    ratingsSection.changeStarHover();

    ratingsSection.sendStarsToDb();

    ratingsSection.setStars();

    specialties.limitChosenSpecialities();

    leagues.editResults();

    leagues.submitResults();
    //matches.editFormFields();
});


// TO BE REFACTORED!!!