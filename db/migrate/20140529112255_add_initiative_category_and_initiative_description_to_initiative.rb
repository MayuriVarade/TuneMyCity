class AddInitiativeCategoryAndInitiativeDescriptionToInitiative < ActiveRecord::Migration
  def change
    add_column :initiatives, :initiative_category, :string
    add_column :initiatives, :initiative_description, :text
  end
end
