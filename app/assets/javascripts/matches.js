matches = {};

matches.changeNewMatchTeamsOnLeague = function(){
    $('.team-field-form').hide();
    var teams = $('.match_team_id').html();
    $('.league-field-form').change(function(){
        var league = $('.league-field-form :selected').text();
        var escaped_league = league.replace(/([ #;&, .+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        var options = $(teams).filter("optgroup[label='"+escaped_league+"']").html();
        if (options.length) {
            $('.match_team_id').html(options);
            $('.team-field-form').show();
        } else {
            $('.match_team_id').empty();
            $('.team-field-form').hide();
        }
    });
};

$(document).ready(function(){
    matches.changeNewMatchTeamsOnLeague();
});