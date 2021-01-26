require "test_helper"

class CiudadLocalidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ciudad_localidad = ciudad_localidades(:one)
  end

  test "should get index" do
    get ciudad_localidades_url
    assert_response :success
  end

  test "should get new" do
    get new_ciudad_localidad_url
    assert_response :success
  end

  test "should create ciudad_localidad" do
    assert_difference('CiudadLocalidad.count') do
      post ciudad_localidades_url, params: { ciudad_localidad: {  } }
    end

    assert_redirected_to ciudad_localidad_url(CiudadLocalidad.last)
  end

  test "should show ciudad_localidad" do
    get ciudad_localidad_url(@ciudad_localidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_ciudad_localidad_url(@ciudad_localidad)
    assert_response :success
  end

  test "should update ciudad_localidad" do
    patch ciudad_localidad_url(@ciudad_localidad), params: { ciudad_localidad: {  } }
    assert_redirected_to ciudad_localidad_url(@ciudad_localidad)
  end

  test "should destroy ciudad_localidad" do
    assert_difference('CiudadLocalidad.count', -1) do
      delete ciudad_localidad_url(@ciudad_localidad)
    end

    assert_redirected_to ciudad_localidades_url
  end
end
