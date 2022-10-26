require "test_helper"

class Public::NgExpressionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_ng_expression_index_url
    assert_response :success
  end

  test "should get show" do
    get public_ng_expression_show_url
    assert_response :success
  end
end
