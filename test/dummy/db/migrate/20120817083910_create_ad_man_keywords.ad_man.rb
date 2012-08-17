# This migration comes from ad_man (originally 20120808091446)
class CreateAdManKeywords < ActiveRecord::Migration
  def change
    create_table :ad_man_keywords do |t|
      t.string :name
      t.timestamps
    end
  end
end
