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
        }).success(function(data){
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "/matches/" + matchId,
            }).success(function(data){
                var input_scores_button = $('.input-scores-button');
                var scores = $('.' + input_scores_button.attr('data_scores_match_id'));
                var team_a_score_element = $('#team_a_score_' + matchId);
                var team_b_score_element = $('#team_b_score_' + matchId);
                var team_a_score = data['team_a_score'];
                var team_b_score = data['team_b_score'];
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
    leagues.editResults();
    leagues.submitResults();
});
