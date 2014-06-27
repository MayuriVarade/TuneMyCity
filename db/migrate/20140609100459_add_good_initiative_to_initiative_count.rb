class AddGoodInitiativeToInitiativeCount < ActiveRecord::Migration
  def change
    add_column :initiative_counts, :good_initiative, :integer
  end
end
