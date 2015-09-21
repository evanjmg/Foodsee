// Image like buttons
function putRequestWithNoData (url, message) {
   $.ajax({
    url: url,
    type: 'PUT'
  }).done(function(resp) {
      console.log(message);
      console.log(resp);
  });
}

$(function() {

  $('.like').on('click', function () {
    event.preventDefault();
    putRequestWithNoData(document.location.pathname+'/like', 'user liked it');
    console.log('liked clicked');

    // remove like button and replace with Liked button
    $('.like').after("<button class='but liked show-page-button' disabled='false'>Liked</button>");
    $('.like').remove()
    // $('.liked').show()
})
  $('.liked').on('click', function () {
    event.preventDefault();
    putRequestWithNoData(document.location.pathname +'/unlike', 'user unliked it' );
    console.log('unliked clicked');
    $('.liked').after("<button class='but like show-page-button' disabled='false'>Like</button>");
    $('.liked').remove()
  })
})
//   $( this ).addClass( "done" );
// });
// })

// Restaurant like buttons