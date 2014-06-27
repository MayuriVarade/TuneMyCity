class CreateCityPhotos < ActiveRecord::Migration
  def change
    create_table :city_photos do |t|
      t.string :title
      t.text :about
      t.string :name
      t.integer :user_id
      t.boolean :is_approved

      t.timestamps
    end
  end
end
