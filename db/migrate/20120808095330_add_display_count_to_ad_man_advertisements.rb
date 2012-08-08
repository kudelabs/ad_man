class AddDisplayCountToAdManAdvertisements < ActiveRecord::Migration
  def change
    add_column :ad_man_advertisements, :display_count, :integer, :null => false, :default => 0
  end
end
