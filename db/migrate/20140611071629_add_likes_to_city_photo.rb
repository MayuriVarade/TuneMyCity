class AddLikesToCityPhoto < ActiveRecord::Migration
  def change
    add_column :city_photos, :likes, :integer
  end
end
