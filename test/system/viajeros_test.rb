require "application_system_test_case"

class ViajerosTest < ApplicationSystemTestCase
  setup do
    @viajero = viajeros(:one)
  end

  test "visiting the index" do
    visit viajeros_url
    assert_selector "h1", text: "Viajeros"
  end

  test "creating a Viajero" do
    visit viajeros_url
    click_on "New Viajero"

    fill_in "Correo viajero", with: @viajero.correo_viajero
    fill_in "Fecha nacimiento", with: @viajero.fecha_nacimiento
    fill_in "Genero", with: @viajero.genero
    fill_in "Primer apellido", with: @viajero.primer_apellido
    fill_in "Primer nombre", with: @viajero.primer_nombre
    fill_in "Segundo apellido", with: @viajero.segundo_apellido
    fill_in "Segundo nombre", with: @viajero.segundo_nombre
    click_on "Create Viajero"

    assert_text "Viajero was successfully created"
    click_on "Back"
  end

  test "updating a Viajero" do
    visit viajeros_url
    click_on "Edit", match: :first

    fill_in "Correo viajero", with: @viajero.correo_viajero
    fill_in "Fecha nacimiento", with: @viajero.fecha_nacimiento
    fill_in "Genero", with: @viajero.genero
    fill_in "Primer apellido", with: @viajero.primer_apellido
    fill_in "Primer nombre", with: @viajero.primer_nombre
    fill_in "Segundo apellido", with: @viajero.segundo_apellido
    fill_in "Segundo nombre", with: @viajero.segundo_nombre
    click_on "Update Viajero"

    assert_text "Viajero was successfully updated"
    click_on "Back"
  end

  test "destroying a Viajero" do
    visit viajeros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Viajero was successfully destroyed"
  end
end
