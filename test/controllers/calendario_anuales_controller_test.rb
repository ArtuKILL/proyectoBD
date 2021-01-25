require "test_helper"

class CalendarioAnualesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calendario_anual = calendario_anuales(:one)
  end

  test "should get index" do
    get calendario_anuales_url
    assert_response :success
  end

  test "should get new" do
    get new_calendario_anual_url
    assert_response :success
  end

  test "should create calendario_anual" do
    assert_difference('CalendarioAnual.count') do
      post calendario_anuales_url, params: { calendario_anual: {  } }
    end

    assert_redirected_to calendario_anual_url(CalendarioAnual.last)
  end

  test "should show calendario_anual" do
    get calendario_anual_url(@calendario_anual)
    assert_response :success
  end

  test "should get edit" do
    get edit_calendario_anual_url(@calendario_anual)
    assert_response :success
  end

  test "should update calendario_anual" do
    patch calendario_anual_url(@calendario_anual), params: { calendario_anual: {  } }
    assert_redirected_to calendario_anual_url(@calendario_anual)
  end

  test "should destroy calendario_anual" do
    assert_difference('CalendarioAnual.count', -1) do
      delete calendario_anual_url(@calendario_anual)
    end

    assert_redirected_to calendario_anuales_url
  end
end
