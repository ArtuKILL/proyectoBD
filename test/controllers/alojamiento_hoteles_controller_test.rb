require "test_helper"

class AlojamientoHotelesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alojamiento_hotel = alojamiento_hoteles(:one)
  end

  test "should get index" do
    get alojamiento_hoteles_url
    assert_response :success
  end

  test "should get new" do
    get new_alojamiento_hotel_url
    assert_response :success
  end

  test "should create alojamiento_hotel" do
    assert_difference('AlojamientoHotel.count') do
      post alojamiento_hoteles_url, params: { alojamiento_hotel: {  } }
    end

    assert_redirected_to alojamiento_hotel_url(AlojamientoHotel.last)
  end

  test "should show alojamiento_hotel" do
    get alojamiento_hotel_url(@alojamiento_hotel)
    assert_response :success
  end

  test "should get edit" do
    get edit_alojamiento_hotel_url(@alojamiento_hotel)
    assert_response :success
  end

  test "should update alojamiento_hotel" do
    patch alojamiento_hotel_url(@alojamiento_hotel), params: { alojamiento_hotel: {  } }
    assert_redirected_to alojamiento_hotel_url(@alojamiento_hotel)
  end

  test "should destroy alojamiento_hotel" do
    assert_difference('AlojamientoHotel.count', -1) do
      delete alojamiento_hotel_url(@alojamiento_hotel)
    end

    assert_redirected_to alojamiento_hoteles_url
  end
end
