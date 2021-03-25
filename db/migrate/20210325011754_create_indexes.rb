class CreateIndexes < ActiveRecord::Migration[6.1]
  def change
  	add_index :campaign_quotas, :campaign_id	
  	add_index :campaign_qualifications, :campaign_quota_id	
  end
end
