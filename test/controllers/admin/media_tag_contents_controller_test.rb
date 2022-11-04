require "test_helper"

class Admin::MediaTagContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_media_tag_contents_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_media_tag_contents_destroy_url
    assert_response :success
  end
end
