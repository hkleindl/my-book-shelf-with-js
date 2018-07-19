# Specifications for the Rails Assessment

Specs:

- [x] Using Ruby on Rails for the project
  
  _Using Rails 5.2.0_
 
- [x] Include at least one has_many relationship (x has\_many y e.g. User has\_many Recipes) 

  _Multiple models using has\_many relationships (User has\_many Books, Book has\_many Ratings etc.)_

- [x] Include at least one belongs\_to relationship (x belongs\_to y e.g. Post belongs_to User)

  _Multiple models using belongs\_to relationships (Rating belongs\_to User, BookGenre belongs\_to Book etc.)_

- [x] Include at least one has\_many through relationship (x has\_many y through z e.g. Recipe 
has_many Items through Ingredients)

  _User has\_many Books through Ratings_

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute\_name e.g. ingredients.quantity)

  _Rating has star attribute_

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

  _Multiple validations on models (User validates presence, uniqueness of username, Rating validates inclusion of stars attribute with a value of 1 through 5 etc.)_

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most\_recipes URL: /users/most_recipes)

  _Book has ::highly\_rated and ::popluar scope methods_

- [x] Include signup (how e.g. Devise)

  _Create new User object with appropriate attributes, then save instance of User to database_

- [x] Include login (how e.g. Devise)

  _Search database for the User object using the input from the login form and authenticate input is correct then set user\_id attribute in session hash to the User's id_

- [x] Include logout (how e.g. Devise)

  _Delete user\_id attribute from session hash_

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

  _Using Omniauth to signup/login through Github_

- [x] Include nested resource show or index (URL e.g. users/2/recipes)

  _users/:id/books_

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)

  _users/:id/books/new_

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

  _Sign up page displays validation errors, books/new displays validation errors_

Confirm:

- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate