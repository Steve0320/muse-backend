Rails.application.routes.draw do

  # API-specific routes
  scope :api do

    # Movie routes
    scope :film do
      resources :movies
      get 'search', to: 'movies#search', as: 'movie_search'
    end

    # TV routes
    scope :tv do
      resources :shows do
        resources :seasons
      end
      resources :seasons
      resources :episodes
    end

  end

end
