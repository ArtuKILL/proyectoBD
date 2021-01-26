require "test_helper"

class ItinerarioAtraccionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itinerario_atraccion = itinerario_atracciones(:one)
  end

  test "should get index" do
    get itinerario_atracciones_url
    assert_response :success
  end

  test "should get new" do
    get new_itinerario_atraccion_url
    assert_response :success
  end

  test "should create itinerario_atraccion" do
    assert_difference('ItinerarioAtraccion.count') do
      post itinerario_atracciones_url, params: { itinerario_atraccion: {  } }
    end

    assert_redirected_to itinerario_atraccion_url(ItinerarioAtraccion.last)
  end

  test "should show itinerario_atraccion" do
    get itinerario_atraccion_url(@itinerario_atraccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_itinerario_atraccion_url(@itinerario_atraccion)
    assert_response :success
  end

  test "should update itinerario_atraccion" do
    patch itinerario_atraccion_url(@itinerario_atraccion), params: { itinerario_atraccion: {  } }
    assert_redirected_to itinerario_atraccion_url(@itinerario_atraccion)
  end

  test "should destroy itinerario_atraccion" do
    assert_difference('ItinerarioAtraccion.count', -1) do
      delete itinerario_atraccion_url(@itinerario_atraccion)
    end

    assert_redirected_to itinerario_atracciones_url
  end
end
