require "test_helper"

class HistPreciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hist_precio = hist_precios(:one)
  end

  test "should get index" do
    get hist_precios_url
    assert_response :success
  end

  test "should get new" do
    get new_hist_precio_url
    assert_response :success
  end

  test "should create hist_precio" do
    assert_difference('HistPrecio.count') do
      post hist_precios_url, params: { hist_precio: {  } }
    end

    assert_redirected_to hist_precio_url(HistPrecio.last)
  end

  test "should show hist_precio" do
    get hist_precio_url(@hist_precio)
    assert_response :success
  end

  test "should get edit" do
    get edit_hist_precio_url(@hist_precio)
    assert_response :success
  end

  test "should update hist_precio" do
    patch hist_precio_url(@hist_precio), params: { hist_precio: {  } }
    assert_redirected_to hist_precio_url(@hist_precio)
  end

  test "should destroy hist_precio" do
    assert_difference('HistPrecio.count', -1) do
      delete hist_precio_url(@hist_precio)
    end

    assert_redirected_to hist_precios_url
  end
end
