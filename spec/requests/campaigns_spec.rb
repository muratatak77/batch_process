require 'rails_helper'

RSpec.describe "/campaigns", type: :request do
   describe "POST / CREATE Get All Campaigns and create on the DB" do
    it "creates a new Campaign - Listing" do
      
      post campaigns_url
      record_size = Campaign.count 
      expect(record_size).to be > 0
      puts "-------------------------------------"

      sleep(2)
      post campaign_quotas_url
      expect(CampaignQuota.count).to be > 0
      puts "-------------------------------------"

      sleep(2)
      expect(CampaignQualification.count).to be > 0
      puts "-------------------------------------"
      sleep(2)

      get ordered_campaigns_url

    end

  end

end
