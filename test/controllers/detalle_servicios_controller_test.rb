require "test_helper"

class DetalleServiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_servicio = detalle_servicios(:one)
  end

  test "should get index" do
    get detalle_servicios_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_servicio_url
    assert_response :success
  end

  test "should create detalle_servicio" do
    assert_difference('DetalleServicio.count') do
      post detalle_servicios_url, params: { detalle_servicio: {  } }
    end

    assert_redirected_to detalle_servicio_url(DetalleServicio.last)
  end

  test "should show detalle_servicio" do
    get detalle_servicio_url(@detalle_servicio)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_servicio_url(@detalle_servicio)
    assert_response :success
  end

  test "should update detalle_servicio" do
    patch detalle_servicio_url(@detalle_servicio), params: { detalle_servicio: {  } }
    assert_redirected_to detalle_servicio_url(@detalle_servicio)
  end

  test "should destroy detalle_servicio" do
    assert_difference('DetalleServicio.count', -1) do
      delete detalle_servicio_url(@detalle_servicio)
    end

    assert_redirected_to detalle_servicios_url
  end
end
