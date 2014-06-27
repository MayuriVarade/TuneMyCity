class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :initiative
      t.text :body

      t.timestamps
    end
    add_index :comments, :initiative_id
  end
end
