Rails.application.routes.draw do
  resources :campaigns, only: [:create]
  resources :campaign_quotas, only: [:create]
  get '/ordered_campaigns', to: 'campaigns#ordered_campaigns'
end
