// $(document).on('turbolinks:load', function() {

//   $.ajaxSetup({
//     cache:false
//   });

//   $('#rate-book').on('click', function(e) {
//     e.preventDefault();
//     $('#rating-form').toggle();
//   })

//   // $('#new_rating').submit(function(e) {
//   //   e.preventDefault();
//   //   let formData = $(this).serialize();
//     // $.ajax({
//     //   type: 'POST',
//     //   url: this.action,
//     //   data: $(this).serialize(),
//     //   success: function(rating) {
//     //     debugger
//     //   }
//     // })

//   //   let rating = $.post('/ratings', formData)
//   //   rating.done(function(data) {
//   //     debugger
//   //     $.getJSON('/books/1')
//   //   })
//   // })

//   let bookID = $('h1').data('id')
//   $.getJSON(`/books/${bookID}`, function(resp) {
    
//     var ratingsList = resp.ratings;
//     var i = 0;

//     $('#new_rating').submit(function(e) {
//       e.preventDefault();
//       let formData = $(this).serialize();
//       // $.ajax({
//       //   type: 'POST',
//       //   url: this.action,
//       //   data: $(this).serialize(),
//       //   success: function(rating) {
//       //     debugger
//       //   }
//       // })
  
//       let rating = $.post('/ratings', formData)
//       rating.done(function(r) {
//       //  debugger
//        $('#list').html(`${r.user_name} - ${r.stars} stars`)
        
//       })
//     })

//     $('#list').html(`${ratingsList[0].user_name} - ${ratingsList[0].stars} stars`);

//     $('#prev').on('click', function(e) {
//       e.preventDefault;
//       $('#list').html(prevItem());
//     })

//     $('#next').on('click', function(e) {
//       e.preventDefault;
//       $('#list').html(nextItem());
//     })

//     function prevItem() {
//       if (i === 0) {
//         i = ratingsList.length;
//       }
//       i--;
//       return `${ratingsList[i].user_name} - ${ratingsList[i].stars} stars`;
//     }

//     function nextItem() {
//       i++;
//       i = i % ratingsList.length;
//       return `${ratingsList[i].user_name} - ${ratingsList[i].stars} stars`;
//     }
//   })
// });