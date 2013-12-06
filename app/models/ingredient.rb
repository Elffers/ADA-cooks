class Ingredient < ActiveRecord::Base
  has_many :ingredients_recipes
  has_many :recipes, through: :ingredients_recipes
  validates_uniqueness_of :name, :case_sensitive => false

  def self.find_by_name(name)
    self.find(:first, :conditions => ["lower(name)=?", name.downcase])
  end
end
