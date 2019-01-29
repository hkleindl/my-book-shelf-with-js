var json = $.getJSON('/books/1')
var ratingsList = json.responseJSON.ratings

var i = 0

$('#list').html(ratingsList[0])

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
  return ratingsList[i]
}

function nextItem() {
  i++;
  i = i % ratingsList.length
  return ratingsList[i]
}