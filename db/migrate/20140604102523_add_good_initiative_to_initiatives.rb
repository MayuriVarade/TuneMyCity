class AddGoodInitiativeToInitiatives < ActiveRecord::Migration
  def change
    add_column :initiatives, :good_initiative, :integer
  end
end
