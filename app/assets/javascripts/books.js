// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function showStuff(bookId, listName) {
  $.get(`/books/${bookId}`, function(resp) {
    // debugger

    $(`#${listName}-${bookId}`).html(
        `by: <a href="/authors/${resp.author.id}">${resp.author.name}</a><br>
         Average User Rating: ${resp.average_star_rating} stars`
      ).toggle(100, "swing")
  })
}