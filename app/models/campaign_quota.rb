class CampaignQuota < ApplicationRecord

  belongs_to :campaign, optional: false
  has_many :campaign_qualifications

  # I got some "ActiveRecord::StatementInvalid (Could not find table)" error, that's why I added.
  self.table_name = 'campaign_quotas'

  class << self

    def is_complete_create?
      get_and_create_quota_qulifications
    end

    private

    def get_and_create_quota_qulifications
      LogHandle.info_ "STARTING BATCH PROCESS -  get quota and qualifications create all campaigns"
      result_obj  = []
      ids = Campaign.all_ids
      return nil unless ids.present?
      urls = []
      ids.each do |cmp_id|
        urls << Constant::CORE_URL + "campaigns/"+cmp_id.to_s
      end
      responses = RestUtil.run(urls, is_batch:true)
      return nil if responses.nil?
      result_obj =  get_result_obj(responses)
      LogHandle.info_ "We generated CampaignQuota objects : #{result_obj}"

      response = create_by_using_import(result_obj)
      if response
        LogHandle.info_ "Success object of campaigns created"
        true
      else
        LogHandle.err_ "Fail object of campaigns created : ERR: #{response.errors}"
        false
      end

    end

    def get_result_obj(responses)
      ans = []
      responses.each do |res|
        campaign_id = res["id"]
        res["campaign_quotas"].each do |quota|
          cq = CampaignQuota.new()
          cq.campaign_id = campaign_id
          cq.id = quota["id"]
          cq.num_respondents = quota["num_respondents"]
          cq.name = quota["cpnamei"]
          quals = quota["campaign_qualifications"]
          next unless quals.present?
          qualifications = CampaignQualification.get_qualifications(quals)
          next if qualifications.nil?
          cq.campaign_qualifications.build(qualifications)
          ans << cq
        end
      end
      ans
    end

    # NOTE: Recursive : This only works with PostgreSQL and ActiveRecord objects. This won't work with hashes or arrays as recursive inputs.
    def create_by_using_import(result_obj)
      ActiveRecord::Base.transaction do
        CampaignQuota.import! result_obj, recursive: true  # or use import!
      end
    end


  end


end
