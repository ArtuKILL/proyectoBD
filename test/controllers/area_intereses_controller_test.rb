require "test_helper"

class AreaInteresesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_interes = area_intereses(:one)
  end

  test "should get index" do
    get area_intereses_url
    assert_response :success
  end

  test "should get new" do
    get new_area_interes_url
    assert_response :success
  end

  test "should create area_interes" do
    assert_difference('AreaInteres.count') do
      post area_intereses_url, params: { area_interes: {  } }
    end

    assert_redirected_to area_interes_url(AreaInteres.last)
  end

  test "should show area_interes" do
    get area_interes_url(@area_interes)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_interes_url(@area_interes)
    assert_response :success
  end

  test "should update area_interes" do
    patch area_interes_url(@area_interes), params: { area_interes: {  } }
    assert_redirected_to area_interes_url(@area_interes)
  end

  test "should destroy area_interes" do
    assert_difference('AreaInteres.count', -1) do
      delete area_interes_url(@area_interes)
    end

    assert_redirected_to area_intereses_url
  end
end
