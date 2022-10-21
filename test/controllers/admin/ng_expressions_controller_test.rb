require "test_helper"

class Admin::NgExpressionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_ng_expressions_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_ng_expressions_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_ng_expressions_edit_url
    assert_response :success
  end
end
