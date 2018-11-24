require 'test_helper'

class DesiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desire = desires(:one)
  end

  test "should get index" do
    get desires_url
    assert_response :success
  end

  test "should get new" do
    get new_desire_url
    assert_response :success
  end

  test "should create desire" do
    assert_difference('Desire.count') do
      post desires_url, params: { desire: {  } }
    end

    assert_redirected_to desire_url(Desire.last)
  end

  test "should show desire" do
    get desire_url(@desire)
    assert_response :success
  end

  test "should get edit" do
    get edit_desire_url(@desire)
    assert_response :success
  end

  test "should update desire" do
    patch desire_url(@desire), params: { desire: {  } }
    assert_redirected_to desire_url(@desire)
  end

  test "should destroy desire" do
    assert_difference('Desire.count', -1) do
      delete desire_url(@desire)
    end

    assert_redirected_to desires_url
  end
end
