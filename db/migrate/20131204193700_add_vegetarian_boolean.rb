class AddVegetarianBoolean < ActiveRecord::Migration
  def change
    add_column :recipes, :vegetarian, :boolean
    add_column :recipes, :gluten, :boolean
    add_column :recipes, :dairy, :boolean
    add_column :recipes, :soy, :boolean
    add_column :recipes, :vegan, :boolean

  end
end
