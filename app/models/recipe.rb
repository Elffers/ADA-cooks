class Recipe < ActiveRecord::Base
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes 
  has_many :cookbook_recipes
  has_many :cookbooks, through: :cookbook_recipes
end
