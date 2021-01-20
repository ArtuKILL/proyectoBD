require "test_helper"

class RalliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rally = rallies(:one)
  end

  test "should get index" do
    get rallies_url
    assert_response :success
  end

  test "should get new" do
    get new_rally_url
    assert_response :success
  end

  test "should create rally" do
    assert_difference('Rally.count') do
      post rallies_url, params: { rally: {  } }
    end

    assert_redirected_to rally_url(Rally.last)
  end

  test "should show rally" do
    get rally_url(@rally)
    assert_response :success
  end

  test "should get edit" do
    get edit_rally_url(@rally)
    assert_response :success
  end

  test "should update rally" do
    patch rally_url(@rally), params: { rally: {  } }
    assert_redirected_to rally_url(@rally)
  end

  test "should destroy rally" do
    assert_difference('Rally.count', -1) do
      delete rally_url(@rally)
    end

    assert_redirected_to rallies_url
  end
end
