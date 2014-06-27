class AddCityNameTocityPhoto < ActiveRecord::Migration
   def change
    add_column :city_photos, :city_name, :string
   
  end
end
