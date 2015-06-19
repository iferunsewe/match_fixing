
//
//ratingsSection.getScore = function(ratingId, ratingScore){
//    $.ajax({
//        url: '/ratings/' + ratingId,
//        type: 'PATCH',
//        data: {score: ratingScore},
//        dataType: "json"
//    }).success(function(data){
//        console.log(data)
//    });
//};
//
//$(document).ready(function(){
//    $('#player_rating').raty(
//        path: '/assets'
//        'click', ratingsSection.getScore
//    )
//});





//$(document).ready(function(){
//
//    $('#player_rating').raty({
//        score: <%= @rating.score %>,
//        path: '/assets',
//        click: function(score, evt) {
//        $.ajax({
//            url: '/ratings/' + <%= @rating.id %>,
//            type: 'PATCH',
//            data: { score: score }
//        });
//        }
//    });
//
//});


//railsAjax = {};
//
//
//railsAjax.getVotes = function(photoId){
//    $.ajax({
//        url: '/photos/' + photoId,
//        type: 'GET',
//        dataType: "json"
//    }).success(function(data){
//        $('.no_votes').html('')
//        $('.no_votes').append(data)
//    })
//}
//
//railsAjax.Vote = function(){
//    // event.preventDefault();
//    var photoId = parseInt(window.location.href.split('/').pop())
//    var $this = $(this);
//    railsAjax.getVotes();
//    $.ajax({
//        url: '/votes',
//        method: 'POST',
//        data: {vote: {photo_id: photoId, number_of_votes: $this.data("vote")}},
//        dataType: 'json'
//    }).success(function(data){
//        console.log(data);
//        $('.thumbs').html('');
//        railsAjax.getVotes(photoId);
//    })
//}
//

$(document).ready(function(){
    $('.star_rating').click(function(){
        var star = $(this);
        var form_id = $(this).attr('data-form-id');
        var stars = $(this).attr('data-stars');

        for(i=1; i=5; i++){
            if(i<= stars){
                $('#' + player_id + '_' + i).addClass('on');
            }else{
                $('#' + player_id + '_' + i).removeClass('on');
            }
        }

        $('#' + form_id +'stars').val(stars)
        $.ajax({
            method: 'POST',
            url: $('#' + form_id).attr('action'),
            data: $('#' + form_id).serialize()
        });
    });
});

