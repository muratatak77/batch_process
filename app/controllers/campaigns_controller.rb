require 'json'
class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy]


  # POST /campaigns
  def create
    if Campaign.is_complete_create?
      render json: {data: "OK", status: :created}
    else
      render json: {data: "FAIL", status: :unprocessable_entity}
    end
  end
 
  # GET ordered_campaigns
  def ordered_campaigns
    result = CampaignDao.run()
    puts ">>>>>>>>>    Expected JSON <<<<<<<<<<<< "
    puts JSON.pretty_generate(result)
    puts ">>>>>>>>>    Expected JSON <<<<<<<<<<<< "
    render json: {data: result, status: :created}
  end
  
end
