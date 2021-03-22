class CreateCampaignQualifications < ActiveRecord::Migration[6.1]
  def change
    create_table :campaign_qualifications do |t|
      t.integer :question_id
      t.text :pre_codes
      t.integer :campaign_quota_id
      t.timestamps
    end
  end
end
