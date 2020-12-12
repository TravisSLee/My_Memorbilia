# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
Uses Ruby on Rails framework
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
The user has_many memorabilia. 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
Memorabilia belongs_to an user.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
The user has_many memorabilias and athletes. An athlete has_many users, through memorabilias.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
The user has_many athletes, through memorabilias
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
Memorabilias have two other attributes besides foriegn keys
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
Has validations for all the models.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
Has one ActiveRecord scope method. 
- [x] Include signup (how e.g. Devise)
Users are able to signup.
- [x] Include login (how e.g. Devise)
Users are able to signin.
- [x] Include logout (how e.g. Devise)
Users are able to logout.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
User can use use Github OmniAuth to sign in.
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
It has both nested resource and show.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
Has a nested new form.
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
Form displays validation errors in new or edit form.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate