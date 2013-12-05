class AddNoteToRecipe < ActiveRecord::Migration
  def change
    add_column :cookbook_recipes, :notes, :text
  end
end
