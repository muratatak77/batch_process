class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.integer :length_of_interview
      t.string :cpi
      t.string :name

      t.timestamps
    end
  end
end
