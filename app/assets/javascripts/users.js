$(document).ready(function(){

  $('#hidden-pictures').append($('.picture'));

  $('.photo-index').on('click', function() {
    var index = $(this).attr('data');
    $.ajax({
      type: "GET",
      url: "/get_picture/" + $('#hidden_user_id').val() + "/" + index,
      dataType: "json",
    }).done(show_picture);
  });

  var show_picture = function(photo) {
    $('#shown-picture').attr('src', photo.picture.url);
  };

  $('#play-photos').on('click', function() {
    $('#shown-picture').hide();
    var speed = 2000;
    var timer = setInterval(replacePhoto, speed);
    var photos = $('.hidden_user_photo');
    var length = photos.length;
    var index = 0
    function replacePhoto() {
      photos.eq(index).appendTo('#shown-picture-div').fadeIn(3000).fadeOut(1000).delay(3500);
      index ++;
      if (index >= length) {
        clearInterval(timer);
      };
    };

  });

  var play_photos = function(elem, index, array) {
    $('#shown-picture-div').append('<img src=' + elem + '>').fadeIn(3000).fadeOut(3000);
    $('#shown-picture-div').append('<img src=' + elem + '>').fadeIn(3000).fadeOut(3000);
    $('#shown-picture-div').append('<img src=' + elem + '>').fadeIn(3000).fadeOut(3000);
  };

});

