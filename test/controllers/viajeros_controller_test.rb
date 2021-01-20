require "test_helper"

class ViajerosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @viajero = viajeros(:one)
  end

  test "should get index" do
    get viajeros_url
    assert_response :success
  end

  test "should get new" do
    get new_viajero_url
    assert_response :success
  end

  test "should create viajero" do
    assert_difference('Viajero.count') do
      post viajeros_url, params: { viajero: { correo_viajero: @viajero.correo_viajero, fecha_nacimiento: @viajero.fecha_nacimiento, genero: @viajero.genero, primer_apellido: @viajero.primer_apellido, primer_nombre: @viajero.primer_nombre, segundo_apellido: @viajero.segundo_apellido, segundo_nombre: @viajero.segundo_nombre } }
    end

    assert_redirected_to viajero_url(Viajero.last)
  end

  test "should show viajero" do
    get viajero_url(@viajero)
    assert_response :success
  end

  test "should get edit" do
    get edit_viajero_url(@viajero)
    assert_response :success
  end

  test "should update viajero" do
    patch viajero_url(@viajero), params: { viajero: { correo_viajero: @viajero.correo_viajero, fecha_nacimiento: @viajero.fecha_nacimiento, genero: @viajero.genero, primer_apellido: @viajero.primer_apellido, primer_nombre: @viajero.primer_nombre, segundo_apellido: @viajero.segundo_apellido, segundo_nombre: @viajero.segundo_nombre } }
    assert_redirected_to viajero_url(@viajero)
  end

  test "should destroy viajero" do
    assert_difference('Viajero.count', -1) do
      delete viajero_url(@viajero)
    end

    assert_redirected_to viajeros_url
  end
end
