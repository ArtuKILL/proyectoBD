require "application_system_test_case"

class DetalleServiciosTest < ApplicationSystemTestCase
  setup do
    @detalle_servicio = detalle_servicios(:one)
  end

  test "visiting the index" do
    visit detalle_servicios_url
    assert_selector "h1", text: "Detalle Servicios"
  end

  test "creating a Detalle servicio" do
    visit detalle_servicios_url
    click_on "New Detalle Servicio"

    click_on "Create Detalle servicio"

    assert_text "Detalle servicio was successfully created"
    click_on "Back"
  end

  test "updating a Detalle servicio" do
    visit detalle_servicios_url
    click_on "Edit", match: :first

    click_on "Update Detalle servicio"

    assert_text "Detalle servicio was successfully updated"
    click_on "Back"
  end

  test "destroying a Detalle servicio" do
    visit detalle_servicios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Detalle servicio was successfully destroyed"
  end
end
