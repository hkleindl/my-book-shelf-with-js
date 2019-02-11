class Book {
  constructor(attributes) {
    this.id = attributes.id
    this.name = attributes.name
    this.author = attributes.author
    this.ratings = attributes.ratings
    this.averageStarRating = attributes.average_star_rating
  }
}

function showDetails(bookId, listName) {
  showStuff(bookId, listName);
}

// function currentUserRating(bookId, listName) {
//   $.getJSON(`/books/${bookId}`, function(resp) {
//     var rating = resp.ratings.filter(function(r) {
//       return r.user_id === $('#user-id').data('user-id')
//     })
//     debugger
//     $(`#${listName}-${bookId}`).html(`My Rating: ${rating[0].stars}`).toggle(100, "swing")
//     alert(rating[0].stars)
//   })
// }

// $.getJSON('/books/1', function(r) {
//   r1 = r.ratings.filter(e => e.user_id === 1)
// })
// r1[0]

function showStuff(bookId, listName) {
  $.getJSON(`/books/${bookId}`, function(resp) {
    $(`#${listName}-${bookId}`).html(
        `by: <a href="/authors/${resp.author.id}">${resp.author.name}</a><br>
         Average User Rating: ${resp.average_star_rating} stars`
      ).toggle(100, "swing")
  })
}