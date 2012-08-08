class AddPriorityToAdManAdvertisements < ActiveRecord::Migration
  def change
    add_column :ad_man_advertisements, :priority, :integer
    AdMan::Advertisement.update_all ["priority = ? ", 1]
  end
end
