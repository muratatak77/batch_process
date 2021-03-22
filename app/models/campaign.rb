class Campaign < ApplicationRecord	

	has_many :campaign_quotas

	validates_presence_of :length_of_interview, :cpi, :name

	class << self

		def is_complete_create?
			get_and_create_campaigns
		end

		def all_ids
			return Campaign.pluck(:id)
		end

		private

		# Activerecord-Import is a library for bulk inserting data using ActiveRecord.
		# https://github.com/zdennis/activerecord-import
		# 
		# 	Better than the :
    # campaigns_response = Campaign.create!(campaigns_arr)
    # create : This code hit Active Record query each time per record
		def get_and_create_campaigns
			LogHandle.info_ "STARTING get and create all campaigns"
	    campaigns_arr = []
			response = RestUtil.run("campaigns")
	    response.each do |cmp|
	      temp = {}
	      temp[:id] = cmp["id"]
	      temp[:length_of_interview] = cmp["length_of_interview"]
	      temp[:cpi] = cmp["cpi"]
	      temp[:name] = cmp["name"]
	      campaigns_arr << temp
	    end
			campaigns_response = Campaign.import! campaigns_arr  # or use import!
			LogHandle.info_ "ALL Campaign will be created object of campaigns array: #{campaigns_arr}"
	    if campaigns_response
				LogHandle.info_ "Success - ALL Campaign were created."
	    	true 
	    else
				LogHandle.err_ "Fail object of campaigns created : ERR: #{campaigns_response.errors}"
	    	false
	    end
		end

	end
end
