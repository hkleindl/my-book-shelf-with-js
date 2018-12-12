// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function showStuff(bookId) {
  $.get(`/books/${bookId}`, function(resp) {
    // debugger

    $(`#${bookId}`).html(resp.id).toggle(100, "swing")
  })
}