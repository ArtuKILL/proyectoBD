require "application_system_test_case"

class PaqueteContratosTest < ApplicationSystemTestCase
  setup do
    @paquete_contrato = paquete_contratos(:one)
  end

  test "visiting the index" do
    visit paquete_contratos_url
    assert_selector "h1", text: "Paquete Contratos"
  end

  test "creating a Paquete contrato" do
    visit paquete_contratos_url
    click_on "New Paquete Contrato"

    fill_in "Email contacto", with: @paquete_contrato.email_contacto
    fill_in "Fecha emision", with: @paquete_contrato.fecha_emision
    fill_in "Fecha salida", with: @paquete_contrato.fecha_salida
    fill_in "Nro factura", with: @paquete_contrato.nro_factura
    fill_in "Nro presupuesto", with: @paquete_contrato.nro_presupuesto
    fill_in "Total calculado", with: @paquete_contrato.total_calculado
    click_on "Create Paquete contrato"

    assert_text "Paquete contrato was successfully created"
    click_on "Back"
  end

  test "updating a Paquete contrato" do
    visit paquete_contratos_url
    click_on "Edit", match: :first

    fill_in "Email contacto", with: @paquete_contrato.email_contacto
    fill_in "Fecha emision", with: @paquete_contrato.fecha_emision
    fill_in "Fecha salida", with: @paquete_contrato.fecha_salida
    fill_in "Nro factura", with: @paquete_contrato.nro_factura
    fill_in "Nro presupuesto", with: @paquete_contrato.nro_presupuesto
    fill_in "Total calculado", with: @paquete_contrato.total_calculado
    click_on "Update Paquete contrato"

    assert_text "Paquete contrato was successfully updated"
    click_on "Back"
  end

  test "destroying a Paquete contrato" do
    visit paquete_contratos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Paquete contrato was successfully destroyed"
  end
end
