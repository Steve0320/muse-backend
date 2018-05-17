class TmdbSearchesController < ApplicationController

  # GET /film/search
  def movie_search
    render json: search('movie', search_params)
  end

  # GET /tv/search
  def tv_search
    render json: search('tv', search_params)
  end

  private

  # Perform a search for the given media type against
  # TMDb's search service
  def search(endpoint, options = {})

    return [] if options[:q].blank?

    response = Faraday.get do |req|
      req.url "https://api.themoviedb.org/3/search/#{endpoint}"
      req.params['api_key'] = '7487a1aeaf17758c1b3f2d52f0c5d813'
      req.params['query'] = options[:q]
      req.params['page'] = options[:page] || 1
      req.params['language'] = options[:lang] || 'en-US'
      req.params['include_adult'] = options[:adult] || false
    end

    results = JSON.parse(response.body)

    return [] if results['results'].blank?

    # Extract needed fields
    results['results'].each do |res|
      res['tmdb_id'] = res['id']
      res.slice!('poster_path', 'overview', 'release_date', 'tmdb_id',
                 'title', 'backdrop_path', 'popularity')
    end

    return results

  end

  def search_params
    params.permit(:q, :page, :lang, :adult)
  end

end
