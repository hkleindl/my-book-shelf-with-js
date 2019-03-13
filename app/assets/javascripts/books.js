class Book {
  constructor(attributes) {
    this.id = attributes.id
    this.name = attributes.name
    this.author = attributes.author
    this.ratings = attributes.ratings
    this.averageStarRating = attributes.average_star_rating
    this.genres = attributes.genres
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
    console.log(this)
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

  static sortByRating() {
    $('#sort-button').on('click', function() {
      $.getJSON('/books', function(resp) {
        let books = resp
        books.sort(function(a, b) {
          return b.average_star_rating - a.average_star_rating
        })
        var htmlStr = ""
        books.map(function(book) {
          htmlStr += `<div class="book_list">
          <h4><li><a href="/books/${book.id}">${book.name}</a></h4>
          <p>by: <a href="/authors/${book.author.id}">${book.author.name}</a></p>`

          $.each(book.genres, function(i, genre) {
          htmlStr += (`<p><a href="/genres/${genre.id}">${genre.name}</a></p>`)
          })

          htmlStr += `<p>Average User Rating: ${book.average_star_rating} stars</p></li></div><br>`

          $('ol').html(htmlStr)
        })
      })
    })
  }

  static ready() {
    Book.sortByRating();
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

  $('.book-button').on('mouseenter', function() {
    var htmlStr = ""
    $.getJSON(`/books/${$(this).data('book-id')
  }`, function(resp) {
      htmlStr += `<h4><a href="/books/${resp.id}">${resp.name}</a></h4>
      <p>by: <a href="/authors/${resp.author.id}">${resp.author.name}</a></p>
      <p>Average User Rating: ${resp.average_star_rating} stars</p>`

      $.each(resp.genres, function(i, e) {
        htmlStr += (`<a href="/genres/${e.id}">${e.name}</a><br>`)
      })
      
      $(`[data-book-id='${resp.id}']`).popover({
        container: 'body',
        html: true,
        content: htmlStr
        }
      )
    }) 
  })

  
})













