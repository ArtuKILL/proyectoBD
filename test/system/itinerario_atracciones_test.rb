require "application_system_test_case"

class ItinerarioAtraccionesTest < ApplicationSystemTestCase
  setup do
    @itinerario_atraccion = itinerario_atracciones(:one)
  end

  test "visiting the index" do
    visit itinerario_atracciones_url
    assert_selector "h1", text: "Itinerario Atracciones"
  end

  test "creating a Itinerario atraccion" do
    visit itinerario_atracciones_url
    click_on "New Itinerario Atraccion"

    click_on "Create Itinerario atraccion"

    assert_text "Itinerario atraccion was successfully created"
    click_on "Back"
  end

  test "updating a Itinerario atraccion" do
    visit itinerario_atracciones_url
    click_on "Edit", match: :first

    click_on "Update Itinerario atraccion"

    assert_text "Itinerario atraccion was successfully updated"
    click_on "Back"
  end

  test "destroying a Itinerario atraccion" do
    visit itinerario_atracciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Itinerario atraccion was successfully destroyed"
  end
end
