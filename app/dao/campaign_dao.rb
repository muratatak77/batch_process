class CampaignDao

	class << self

		def run
			compain_qual_sql = CampaignQualification.order_qualification.to_sql
	    @join_sql = " LEFT OUTER JOIN campaign_quotas ON campaign_quotas.campaign_id = campaigns.id "
	    @join_sql += " LEFT OUTER JOIN (#{compain_qual_sql}) as sub_query ON sub_query.campaign_quota_id = campaign_quotas.id "
	    @order_sql = "sub_query.qualification_count DESC"
	    @includes_fields = {:campaign_quotas => :campaign_qualifications}

		  campaigns_exist_qual = get_campaigns_exist_qual
			campaigns_no_qual = get_campaigns_no_qual
	    campaigns = campaigns_exist_qual + campaigns_no_qual
	    result = get_campaigns(campaigns) || []
	    LogHandle.info_ "We generated #{result.size} relationship."
	    result
	  end

	  private

	  def get_campaigns_exist_qual
	  	Campaign
	    .includes(@includes_fields)
	    .joins(@join_sql)
	    .where("sub_query.campaign_quota_id IS NOT NULL")
	    .order(@order_sql)
	  end

	  def get_campaigns_no_qual
			Campaign
	    .includes(@includes_fields)
	    .joins(@join_sql)
	    .where("sub_query.campaign_quota_id IS NULL")
	    .order(@order_sql)
	  end

	  def get_campaigns(campaigns)
	  	result = []
	  	cmp_ids = []
	    campaigns.each do |cmp|
	      next if cmp_ids.include?(cmp.id)
	      temp = {}
	      temp[:id] = cmp.id
	      temp[:length_of_interview] = cmp.length_of_interview
	      temp[:cpi] = cmp.cpi
	      temp[:name] = cmp.name
	      temp[:campaign_quotas] = get_campaign_quotas(cmp)
	      result << temp
	      cmp_ids << cmp.id
	    end
	    result
	  end

	  def get_campaign_quotas(cmp)
	    ans = []
	    cmp.campaign_quotas.each do |cq|
	      temp = {}
	      temp[:id] = cq.id
	      temp[:num_respondents] = cq.num_respondents
	      temp[:campaign_qualifications] = get_campaign_qualifications(cq)
	      ans << temp
	    end
	    ans
	  end

	  def get_campaign_qualifications(cq)
	    ans = []
	    cq.campaign_qualifications.each do |qua|
	      temp = {}
	      temp[:question_id] = qua.question_id
	      temp[:pre_codes] = qua.pre_codes
	      ans << temp
	    end
	    ans
	  end

	 end

end