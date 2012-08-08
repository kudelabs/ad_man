class AddKeywordIdToAdManAdvertisements < ActiveRecord::Migration
  def change
    add_column :ad_man_advertisements, :keyword_id, :integer
  end
end
