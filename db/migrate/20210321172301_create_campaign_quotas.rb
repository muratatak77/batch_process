class CreateCampaignQuotas < ActiveRecord::Migration[6.1]
  def change
    create_table :campaign_quotas do |t|
      t.integer :num_respondents
      t.string :name
      t.integer :campaign_id
      t.timestamps
    end
  end
end
