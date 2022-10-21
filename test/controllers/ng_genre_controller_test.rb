require "test_helper"

class NgGenreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ng_genre_index_url
    assert_response :success
  end

  test "should get show" do
    get ng_genre_show_url
    assert_response :success
  end

  test "should get edit" do
    get ng_genre_edit_url
    assert_response :success
  end
end
