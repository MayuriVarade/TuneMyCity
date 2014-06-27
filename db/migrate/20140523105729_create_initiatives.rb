class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :title
      t.text :about
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :name
      t.integer :user_id
      t.boolean :is_approved,:default => false
      t.boolean :is_developed

      t.timestamps

    end
    add_index :initiatives, [:user_id]
  end
end
