require "test_helper"

class AtraccionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atraccion = atracciones(:one)
  end

  test "should get index" do
    get atracciones_url
    assert_response :success
  end

  test "should get new" do
    get new_atraccion_url
    assert_response :success
  end

  test "should create atraccion" do
    assert_difference('Atraccion.count') do
      post atracciones_url, params: { atraccion: {  } }
    end

    assert_redirected_to atraccion_url(Atraccion.last)
  end

  test "should show atraccion" do
    get atraccion_url(@atraccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_atraccion_url(@atraccion)
    assert_response :success
  end

  test "should update atraccion" do
    patch atraccion_url(@atraccion), params: { atraccion: {  } }
    assert_redirected_to atraccion_url(@atraccion)
  end

  test "should destroy atraccion" do
    assert_difference('Atraccion.count', -1) do
      delete atraccion_url(@atraccion)
    end

    assert_redirected_to atracciones_url
  end
end
