Rails.application.routes.draw do

  # API-specific routes
  scope :api do

    # Movie routes
    scope :film do
      resources :movies
      get 'search', to: 'tmdb_searches#movie_search', as: 'movie_search'
    end

    # TV routes
    scope :tv do
      resources :shows do
        resources :seasons do
          resources :episodes
        end
      end
      resources :seasons
      resources :episodes
      get 'search', to: 'tmdb_searches#tv_search', as: 'tv_search'
    end

  end

end
