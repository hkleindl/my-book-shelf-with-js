# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TO DO: create mock users and ratings

kurt_vonnegut = Author.create(name: "Kurt Vonnegut")
virginia_woolf = Author.create(name: "Virginia Woolf")
maya_angelou = Author.create(name: "Maya Angelou")
flann_obrien = Author.create(name: "Flann O'Brien")
mark_danielewski = Author.create(name: "Mark Danielewski")
george_orwell = Author.create(name: "George Orwell")
hunter_thompson = Author.create(name: "Hunter S. Thompson")

fiction = Genre.create(name: "fiction")
autobiography = Genre.create(name: "autobiography")
poetry = Genre.create(name: "poetry")
gonzo = Genre.create(name: "gonzo journalism")
satire = Genre.create(name: "satire")
science_fiction = Genre.create(name: "science fiction")
non_fiction = Genre.create(name: "non-fiction")

Book.create([{ name: "Slaughterhouse Five", 
               author: kurt_vonnegut, 
               genre_ids: [1, 5, 6] },
             { name: "Cat's Cradle", 
               author: kurt_vonnegut,
               genre_ids: [1, 5, 6] },
             { name: "Sirens of Titan",
               author: kurt_vonnegut,
               genre_ids: [1, 6] },
             { name: "A Room of One's Own",
               author: virginia_woolf,
               genre_ids: [7] },
             { name: "To the Lighthouse",
               author: virginia_woolf,
               genre_ids: [1] },
             { name: "And Still I Rise",
               author: maya_angelou,
               genre_ids: [3] },
             { name: "I Know Why the Caged Bird Sings",
               author: maya_angelou,
               genre_ids: [2, 7] },
             { name: "The Third Policeman",
               author: flann_obrien,
               genre_ids: [1] },
             { name: "House of Leaves",
               author: mark_danielewski,
               genre_ids: [1] },
             { name: "Nineteen Eighty-Four", 
               author: george_orwell, 
               genre_ids: [1, 6] },
             { name: "Animal Farm",
               author: george_orwell,
               genre_ids: [1, 5] },
             { name: "Fear and Loathing in Las Vegas",
               author: hunter_thompson,
               genre_ids: [4] }       
             ])

michael = User.create(username: "Michael", 
               email: "michael@email.com",
               password: "123456")

dwight = User.create(username: "Dwight",
               email: "dwight@email.com",
               password: "123456")

jim =  User.create(username: "Jim",
               email: "jim@email.com",
               password: "123456")

Rating.create([{ user_id: 1, book_id: 1, stars: 4},
               { user_id: 1, book_id: 2, stars: 5},
               { user_id: 1, book_id: 3, stars: 3},
               { user_id: 1, book_id: 4, stars: 4},
               { user_id: 1, book_id: 5, stars: 5},
               { user_id: 1, book_id: 6, stars: 2},
               { user_id: 1, book_id: 7, stars: 3},
               { user_id: 1, book_id: 8, stars: 4},
               { user_id: 1, book_id: 9, stars: 4},
               { user_id: 1, book_id: 10, stars: 5},
               { user_id: 1, book_id: 11, stars: 5},
               { user_id: 1, book_id: 12, stars: 2},
               { user_id: 2, book_id: 1, stars: 5},
               { user_id: 2, book_id: 2, stars: 5},
               { user_id: 2, book_id: 3, stars: 4},
               { user_id: 2, book_id: 4, stars: 2},
               { user_id: 2, book_id: 5, stars: 3},
               { user_id: 2, book_id: 6, stars: 4},
               { user_id: 2, book_id: 7, stars: 5},
               { user_id: 2, book_id: 8, stars: 4},
               { user_id: 2, book_id: 9, stars: 3},
               { user_id: 2, book_id: 10, stars: 5},
               { user_id: 2, book_id: 11, stars: 4},
               { user_id: 2, book_id: 12, stars: 4},
               { user_id: 3, book_id: 1, stars: 4},
               { user_id: 3, book_id: 2, stars: 5},
               { user_id: 3, book_id: 3, stars: 3},
               { user_id: 3, book_id: 4, stars: 2},
               { user_id: 3, book_id: 5, stars: 3},
               { user_id: 3, book_id: 6, stars: 4},
               { user_id: 3, book_id: 7, stars: 5},
               { user_id: 3, book_id: 8, stars: 4},
               { user_id: 3, book_id: 9, stars: 3},
               { user_id: 3, book_id: 10, stars: 4},
               { user_id: 3, book_id: 11, stars: 5},
               { user_id: 3, book_id: 12, stars: 5},
               ])              