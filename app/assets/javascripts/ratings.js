$(function() {
  var myJson; 
  $.getJSON('/books/1', function(r) {
    myJson = r;
  
    var ratingsList = myJson.ratings

    var i = 0
    $('#list').html(`${ratingsList[0].user_name} - ${ratingsList[0].stars} stars`)

    $('#prev').on('click', function(e) {
      e.preventDefault;
      $('#list').html(prevItem())
    })

    $('#next').on('click', function(e) {
      e.preventDefault;
      $('#list').html(nextItem())
    })

    function prevItem() {
      if (i === 0) {
        i = ratingsList.length;
      }
      i--;
      return `${ratingsList[i].user_name} - ${ratingsList[i].stars} stars`
    }

    function nextItem() {
      i++;
      i = i % ratingsList.length
      return `${ratingsList[i].user_name} - ${ratingsList[i].stars} stars`
    }
  })
});