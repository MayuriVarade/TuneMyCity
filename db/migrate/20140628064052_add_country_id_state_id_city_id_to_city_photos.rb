class AddCountryIdStateIdCityIdToCityPhotos < ActiveRecord::Migration
  def change
    add_column :city_photos, :country_id, :integer
    add_column :city_photos, :state_id, :integer
    add_column :city_photos, :city_id, :integer
  end
end
