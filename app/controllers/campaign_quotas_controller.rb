class CampaignQuotasController < ApplicationController
  def create
    if CampaignQuota.is_complete_create?
      render json: {data: "OK", status: :created}
    else
      render json: {data: "FAIL", status: :unprocessable_entity}
    end
  end
 
end
