class Book {
  constructor(attributes) {
    this.id = attributes.id
    this.name = attributes.name
    this.author = attributes.author
    this.ratings = attributes.ratings
    this.averageStarRating = attributes.average_star_rating
  }

  renderRatings() {
    let i = 0;
    let ratingsList = this.ratings

    $('#prev').on('click', function(e) {
      e.preventDefault();
      $('#list').html(prevItem());
    })

    $('#next').on('click', function(e) {
      e.preventDefault();
      $('#list').html(nextItem());
    })

    function prevItem() {
      if (i === 0) {
        i = ratingsList.length;
      }
      i--;
      let previous = formatRatingString(ratingsList[i].user_name, ratingsList[i].stars);
      return previous;
    }

    function nextItem() {
      i++;
      i = i % ratingsList.length;
      let next = formatRatingString(ratingsList[i].user_name, ratingsList[i].stars);
      return next;
    }
  }

  renderLastRating() {
    let ratingsList = this.ratings
    let lastRating = ratingsList[ratingsList.length - 1]
    $('#list').html(formatRatingString(lastRating.user_name, lastRating.stars))
  }

  createRating() {
    $('#new_rating').submit(function(e) {
      e.preventDefault();
      let formData = $(this).serialize();
      let rating = $.post('/ratings', formData)
      rating.done(function(rating) {
        let book;
        $.getJSON(`/books/${rating.book_id}`, function(json) {
          book = new Book(json)
          book.renderLastRating();
          book.renderRatings();
          let ratingId = book.ratings[book.ratings.length - 1].id
          $('#rating-form').html("")
          $('#edit-rating').html(`<a class="btn btn-warning" href="/ratings/${ratingId}/edit">Edit My Rating</a> <a data-confirm="Are you sure?" class="btn btn-danger" rel="nofollow" data-method="delete" href="/ratings/${ratingId}">Delete My Rating</a>`)
        })
      })
    })
  }

  static ready() {
    let bookId = $('h1').data('id');
    if (bookId) {
      let book;
      $.getJSON(`/books/${bookId}`, function(r) {
        book = new Book(r)
        book.renderLastRating();
        book.renderRatings();
        book.createRating();
      })
    }
  }
}

function formatRatingString(userName, stars) {
  let string = `${userName} - ${stars} star`
  if (stars !== 1) {
    string += 's'
  } 
  return string;
}

$(document).on('turbolinks:load', function() {

  Book.ready();

  
  $.ajaxSetup({
    cache:false
  });

  // $('.book-button').on('click', function(e) {
  //   e.preventDefault();
  //   // debugger
  //   var bookId = $(this).data('book-id')
  //   this.nextElementSibling.html($.getJSON(`/books/${bookId}`, function(resp) {
  //     return resp.id
  //   })).toggle(100, "swing")
  // })

  
  function showDetails(bookId, listName) {
    showStuff(bookId, listName);
  }

  

})

function showStuff(bookId, listName) {
  $.getJSON(`/books/${bookId}`, function(resp) {
    var html = ""
    html += `<p>by: <a href="/authors/${resp.author.id}">${resp.author.name}</a></p><p>Average User Rating: ${resp.average_star_rating} stars</p>`

    $.each(resp.ratings, function(i, e) {
      html += (`${e.user_name}${e.stars}<br>`)
    })
    $(`#${listName}-${bookId}`).html(html).toggle(100, "swing")
  })
}
