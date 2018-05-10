Rails.application.routes.draw do

  # Movie routes
  jsonapi_resources :movies

  # TV routes
  jsonapi_resources :shows
  jsonapi_resources :seasons
  jsonapi_resources :episodes

end
