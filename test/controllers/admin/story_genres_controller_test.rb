require "test_helper"

class Admin::StoryGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_story_genres_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_story_genres_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_story_genres_edit_url
    assert_response :success
  end
end
