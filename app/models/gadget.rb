class Gadget < ActiveRecord::Base
  has_many :gadget_recipes
  has_many :recipes, through: :gadget_recipes
end
