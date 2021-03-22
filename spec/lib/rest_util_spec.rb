require 'rails_helper'

RSpec.describe "Lib/Rest Util", type: :request do

  url = "campaigns"
  response = RestUtil.run(url)

  describe "Lib/Rest Get All Campaigns" do
    it "shouldn't be empty Campaigns list " do
    	expect(response).not_to be_empty
    end

    it "should be include id in the campaigns[0]  list " do
    	expect(response[0]).to include("id")
    	expect(response[0]).to include("length_of_interview")
    end

    describe "Lib/Rest Get Specific Campaigns" do
	  	url = "campaigns/#{response[0]["id"]}"
	    response2 = RestUtil.run(url)
	    it "shouldn't be empty Campaigns list " do
	    	expect(response2).not_to be_empty
	    	expect(response2).to include("campaign_quotas")
	    end
  	end

  end

end
