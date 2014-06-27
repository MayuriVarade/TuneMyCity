class CreateCityComments < ActiveRecord::Migration
  def change
    create_table :city_comments do |t|
      t.references :city_photo
      t.text :body
      t.integer :user_id
      t.integer :city_photo_id

      t.timestamps
    end
    add_index :city_comments, :city_photo_id
  end
end
