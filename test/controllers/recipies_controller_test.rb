require "test_helper"

class RecipiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recipies_new_url
    assert_response :success
  end

  test "should get create" do
    get recipies_create_url
    assert_response :success
  end

  test "should get edit" do
    get recipies_edit_url
    assert_response :success
  end

  test "should get update" do
    get recipies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get recipies_destroy_url
    assert_response :success
  end
end
