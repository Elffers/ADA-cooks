class CreateCookbookRecipes < ActiveRecord::Migration
  def change
    create_table :cookbook_recipes do |t|
      t.integer :cookbook_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
