require "test_helper"

class PaqueteContratosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paquete_contrato = paquete_contratos(:one)
  end

  test "should get index" do
    get paquete_contratos_url
    assert_response :success
  end

  test "should get new" do
    get new_paquete_contrato_url
    assert_response :success
  end

  test "should create paquete_contrato" do
    assert_difference('PaqueteContrato.count') do
      post paquete_contratos_url, params: { paquete_contrato: { email_contacto: @paquete_contrato.email_contacto, fecha_emision: @paquete_contrato.fecha_emision, fecha_salida: @paquete_contrato.fecha_salida, nro_factura: @paquete_contrato.nro_factura, nro_presupuesto: @paquete_contrato.nro_presupuesto, total_calculado: @paquete_contrato.total_calculado } }
    end

    assert_redirected_to paquete_contrato_url(PaqueteContrato.last)
  end

  test "should show paquete_contrato" do
    get paquete_contrato_url(@paquete_contrato)
    assert_response :success
  end

  test "should get edit" do
    get edit_paquete_contrato_url(@paquete_contrato)
    assert_response :success
  end

  test "should update paquete_contrato" do
    patch paquete_contrato_url(@paquete_contrato), params: { paquete_contrato: { email_contacto: @paquete_contrato.email_contacto, fecha_emision: @paquete_contrato.fecha_emision, fecha_salida: @paquete_contrato.fecha_salida, nro_factura: @paquete_contrato.nro_factura, nro_presupuesto: @paquete_contrato.nro_presupuesto, total_calculado: @paquete_contrato.total_calculado } }
    assert_redirected_to paquete_contrato_url(@paquete_contrato)
  end

  test "should destroy paquete_contrato" do
    assert_difference('PaqueteContrato.count', -1) do
      delete paquete_contrato_url(@paquete_contrato)
    end

    assert_redirected_to paquete_contratos_url
  end
end
