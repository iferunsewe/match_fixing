ratingsSection={},ratingsSection.changeStarImage=function(t,a){for(i=1;i<=5;i++)i<=a?$("#"+t+"_"+i).attr("src","/assets/star-on.png"):$("#"+t+"_"+i).attr("src","/assets/star-off.png")},ratingsSection.changeStarHover=function(){$(".star_rating").hover(function(){var t=$(this),a=t.attr("data-stars"),s=t.attr("data-form-id");ratingsSection.changeStarImage(s,a)},function(){var t=$(this),a=t.attr("data-stars"),s=t.attr("data-form-id");ratingsSection.changeStarImage(s,a)})},ratingsSection.sendStarsToDb=function(){$(".star_rating").click(function(){var t=$(this),a=t.attr("data-form-id"),s=t.attr("data-stars"),e=$("#"+a),i=$("#ratings_form");ratingsSection.changeStarImage(a,s),$("#"+a+"_stars").val(s),$.ajax({method:"POST",url:e.attr("action"),data:e.serialize()}).success(function(){i.html(""),i.append("<p>Rated</p>")})})},ratingsSection.setStars=function(){$(".star_rating_form").each(function(){var t=$(this).attr("id"),a=$("#"+t+"_stars").val();ratingsSection.changeStarImage(t,a)})},specialties={},specialties.limitChosenSpecialities=function(){$(".specialities_checkboxes").click(function(){var t=$(this);t.attr("checked",!0),$(".specialities_checkboxes:checked").length>3?(t.attr("checked",!1),$(".specialties_checkboxes").not(":checked").attr("disabled",!0),alert("You can't have it all. Only 3 specialties can be chosen!")):$(".specialties_checkboxes").removeAttr("disabled")})},matches={},matches.editFormFields=function(){$("#players-stats-selector").change(function(){$(".hidden-option-stats").hide();var t=$(this).val();$("#stat_form"+t).show()})},leagues={},leagues.editResults=function(){$(".input-score").hide(),$(".scores-submit-button").hide(),$(".input-scores-button").click(function(){var t=$(this).attr("data_match_form_id"),a=$("#"+t),s=a.attr("data_match_id"),e=$(this).attr("data_scores_match_id");$(".input_"+e).show(),console.log("#scores-submit-button-"+s),$("."+e).hide(),$(this).hide(),$("#scores-submit-button-"+s).show()})},leagues.submitResults=function(){$(".scores-submit-button").click(function(){var t=$(this).attr("data_match_form_id"),a=$("#"+t),s=a.attr("data_match_id");$.ajax({type:"POST",url:a.attr("action"),data:a.serialize()}).success(function(){console.log("Match data submitted"),$.ajax({type:"GET",dataType:"json",url:"/matches/"+s}).success(function(t){var a=$(".input-scores-button"),e=$("."+a.attr("data_scores_match_id")),i=$("#team_a_score_"+s),c=$("#team_b_score_"+s),n=t.team_a_score,r=t.team_b_score;i.html("").append(n),c.html("").append(r),a.show(),$(".score").show(),$(".input-score").hide(),$(".scores-submit-button").hide(),e.show()})})})},$(document).ready(function(){$(".btn-rate-player").click(),ratingsSection.changeStarHover(),ratingsSection.sendStarsToDb(),ratingsSection.setStars(),specialties.limitChosenSpecialities(),leagues.editResults(),leagues.submitResults()});