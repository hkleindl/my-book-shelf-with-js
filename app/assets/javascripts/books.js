function Book(attributes) {
  this.id = attributes.id
  this.name = attributes.name
  this.author = attributes.author
  this.averageStarRating = attributes.average_star_rating
}

function showStuff(bookId, listName) {
  $.get(`/books/${bookId}`, function(resp) {
    // debugger

    $(`#${listName}-${bookId}`).html(
        `by: <a href="/authors/${resp.author.id}">${resp.author.name}</a><br>
         Average User Rating: ${resp.average_star_rating} stars`
      ).toggle(100, "swing")
  })
}