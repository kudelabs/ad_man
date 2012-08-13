class CreateAdManAdvertisements < ActiveRecord::Migration
  def change
    create_table :ad_man_advertisements do |t|
      t.string :title
      t.string :destination_url
      t.has_attached_file :ad_banner
      t.integer :display_count, :null => false, :default => 0
      t.integer :priority, :null => false, :default => 1
      t.date :start_date
      t.date :end_date
      t.integer :keyword_id
      t.integer :click_count, :null => false, :default => 0
      t.timestamps
    end
  end
end
