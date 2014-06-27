class AddUpsAndDownsToInitiatives < ActiveRecord::Migration
  def change
    add_column :initiatives, :ups, :integer
    add_column :initiatives, :downs, :integer
  end
end
