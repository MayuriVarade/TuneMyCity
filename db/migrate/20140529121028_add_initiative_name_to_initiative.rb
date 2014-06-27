class AddInitiativeNameToInitiative < ActiveRecord::Migration
  def change
    add_column :initiatives, :initiative_name, :string
  end
end
