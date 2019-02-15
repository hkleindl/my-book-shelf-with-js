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
      e.preventDefault;
      $('#list').html(prevItem());
    })

    $('#next').on('click', function(e) {
      e.preventDefault;
      $('#list').html(nextItem());
    })

    function prevItem() {
      if (i === 0) {
        i = ratingsList.length;
      }
      i--;
      return `${ratingsList[i].user_name} - ${ratingsList[i].stars} stars`;
    }

    function nextItem() {
      i++;
      i = i % ratingsList.length;
      return `${ratingsList[i].user_name} - ${ratingsList[i].stars} stars`;
    }
  }

  renderLastRating() {
    let ratingsList = this.ratings
    let lastRating = ratingsList[ratingsList.length - 1]
    let string = `${lastRating.user_name} - ${lastRating.stars} star`
    if (lastRating.stars !== 1) {
      string += 's'
    } 
    $('#list').html(string)
  }

  static ready() {
    let bookId = $('h1').data('id');
    let book;
    $.getJSON(`/books/${bookId}`, function(r) {
      book = new Book(r)
      book.renderLastRating();
      book.renderRatings();
    })
  }
  
}

$(document).on('turbolinks:load', function() {

  Book.ready();

  $.ajaxSetup({
    cache:false
  });


function showDetails(bookId, listName) {
  showStuff(bookId, listName);
}

function showStuff(bookId, listName) {
  $.getJSON(`/books/${bookId}`, function(resp) {
    $(`#${listName}-${bookId}`).html(
        `by: <a href="/authors/${resp.author.id}">${resp.author.name}</a><br>
         Average User Rating: ${resp.average_star_rating} stars`
      ).toggle(100, "swing")
  })
}

})
