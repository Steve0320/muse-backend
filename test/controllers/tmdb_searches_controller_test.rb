require 'test_helper'

class TmdbSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tmdb_search = tmdb_searches(:one)
  end

  test "should get index" do
    get tmdb_searches_url, as: :json
    assert_response :success
  end

  test "should create tmdb_search" do
    assert_difference('TmdbSearch.count') do
      post tmdb_searches_url, params: { tmdb_search: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show tmdb_search" do
    get tmdb_search_url(@tmdb_search), as: :json
    assert_response :success
  end

  test "should update tmdb_search" do
    patch tmdb_search_url(@tmdb_search), params: { tmdb_search: {  } }, as: :json
    assert_response 200
  end

  test "should destroy tmdb_search" do
    assert_difference('TmdbSearch.count', -1) do
      delete tmdb_search_url(@tmdb_search), as: :json
    end

    assert_response 204
  end
end
