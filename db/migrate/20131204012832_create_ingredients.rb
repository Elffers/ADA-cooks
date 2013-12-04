class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :user_id
      t.string :unit

      t.timestamps
    end
  end
end
