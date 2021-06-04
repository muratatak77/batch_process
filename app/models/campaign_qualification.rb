class CampaignQualification < ApplicationRecord

  belongs_to :campaign_quota, optional: false
  validates_presence_of :question_id, :pre_codes

  # I got some "ActiveRecord::StatementInvalid (Could not find table)" error, that's why I added.
  self.table_name = 'campaign_qualifications'

  scope :order_qualification , -> {
    select("
      campaign_qualifications.campaign_quota_id as campaign_quota_id, 
      count(campaign_qualifications.id) as qualification_count 
      ")
    .joins(:campaign_quota)
    .group("campaign_qualifications.campaign_quota_id")
    .order("qualification_count DESC")
  }

  class << self

    def get_qualifications(qualifications)
      init(qualifications)
      _prepared_by_hash
    end

    private

    def init(qualifications)
      @qualifications = qualifications
    end

    def _prepared_by_hash
      result  = []
      @qualifications.each do |qua|
        temp = {}
        temp[:question_id] = qua["question_id"]
        temp[:pre_codes] = qua["pre_codes"].join(",") if qua["pre_codes"]
        result << temp
      end
      result
    end

  end

end
