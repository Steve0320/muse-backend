require 'test_helper'

class MovieSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_search = movie_searches(:one)
  end

  test "should get index" do
    get movie_searches_url, as: :json
    assert_response :success
  end

  test "should create movie_search" do
    assert_difference('MovieSearch.count') do
      post movie_searches_url, params: { movie_search: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show movie_search" do
    get movie_search_url(@movie_search), as: :json
    assert_response :success
  end

  test "should update movie_search" do
    patch movie_search_url(@movie_search), params: { movie_search: {  } }, as: :json
    assert_response 200
  end

  test "should destroy movie_search" do
    assert_difference('MovieSearch.count', -1) do
      delete movie_search_url(@movie_search), as: :json
    end

    assert_response 204
  end
end
