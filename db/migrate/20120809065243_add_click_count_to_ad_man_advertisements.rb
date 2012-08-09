class AddClickCountToAdManAdvertisements < ActiveRecord::Migration
  def change
    add_column :ad_man_advertisements, :click_count, :integer
  end
end
