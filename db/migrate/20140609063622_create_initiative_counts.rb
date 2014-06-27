class CreateInitiativeCounts < ActiveRecord::Migration
  def change
    create_table :initiative_counts do |t|
      t.integer :user_id
      t.integer :initiative_id
      t.integer :ups
      t.integer :downs

      t.timestamps
    end
  end
end
