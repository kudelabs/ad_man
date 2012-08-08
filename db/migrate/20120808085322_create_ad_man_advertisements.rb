class CreateAdManAdvertisements < ActiveRecord::Migration
  def change
    create_table :ad_man_advertisements do |t|
      t.string :title
      t.string :destination_url

      t.timestamps
    end
  end
end
