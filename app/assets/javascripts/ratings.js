$(function() {

  $.ajaxSetup({
    cache:false
  });

  $('#rate-book').on('click', function(e) {
    e.preventDefault();
    $('#rating-form').toggle();
  })

  $('#new_rating').submit(function(e) {
    e.preventDefault();
    let formData = $(this)
    $.ajax({
      type: 'POST',
      url: this.action,
      data: $(this).serialize(),
      success: function(r) {
        alert(r)
      },
      error: function(x, y, z) {
        alert(z);
      }

    })

    // let rating = $.post('/ratings', formData)
    // debugger
    // rating.done(function(data) {
    //   $.getJSON('/books/1')
    // })
  })

  let bookID = $('h1').data('id')
  $.getJSON(`/books/${bookID}`, function(resp) {
    
    var ratingsList = resp.ratings;
    var i = 0;

    $('#list').html(`${ratingsList[0].user_name} - ${ratingsList[0].stars} stars`);

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
  })
});