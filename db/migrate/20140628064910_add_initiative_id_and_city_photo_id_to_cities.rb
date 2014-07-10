class AddInitiativeIdAndCityPhotoIdToCities < ActiveRecord::Migration
  def change
    add_column :cities, :initiative_id, :integer
    add_column :cities, :city_photo_id, :integer
  end
end
