class AddAttachmentAdBannerToAdvertisements < ActiveRecord::Migration
  def self.up
    change_table :ad_man_advertisements do |t|
      t.has_attached_file :ad_banner
    end
  end

  def self.down
    drop_attached_file :ad_man_advertisements, :ad_banner
  end
end
