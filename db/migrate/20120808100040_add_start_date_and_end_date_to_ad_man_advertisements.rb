class AddStartDateAndEndDateToAdManAdvertisements < ActiveRecord::Migration
  def change
    add_column :ad_man_advertisements, :start_date, :date
    add_column :ad_man_advertisements, :end_date, :date
    AdMan::Advertisement.update_all ["start_date = ?", Date.today]
		AdMan::Advertisement.update_all ["end_date = ?", Date.today+30]
  end
end
