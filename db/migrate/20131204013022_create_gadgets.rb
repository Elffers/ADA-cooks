class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string :name
      t.integer :user_id
      t.string :function

      t.timestamps
    end
  end
end
