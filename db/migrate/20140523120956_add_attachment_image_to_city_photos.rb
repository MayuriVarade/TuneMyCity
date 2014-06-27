class AddAttachmentImageToCityPhotos < ActiveRecord::Migration
  def self.up
    change_table :city_photos do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :city_photos, :image
  end
end
