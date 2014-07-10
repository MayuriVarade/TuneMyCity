class AddCountryIdStateIdCityIdToInitiatives < ActiveRecord::Migration
  def change
    add_column :initiatives, :country_id, :integer
    add_column :initiatives, :state_id, :integer
    add_column :initiatives, :city_id, :integer
  end
end
