class Recipe < ActiveRecord::Base
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes 
  has_many :cookbook_recipes
  has_many :cookbooks, through: :cookbook_recipes
  has_many :gadget_recipes
  has_many :gadgets, through: :gadget_recipes

  def self.by_ingredient_name(name)
    includes(:ingredients).where(ingredients: {name: name})
  end

  def self.vegan
    where(vegan: true)
  end

  def self.search(search_term)
    if search_term
      includes(:ingredients).where("(recipes.name) LIKE :s OR ingredients.name LIKE :s", s: "%#{search_term.downcase}%")
    else
      all
    end
  end

end
