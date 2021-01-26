require "application_system_test_case"

class ItinerariosTest < ApplicationSystemTestCase
  setup do
    @itinerario = itinerarios(:one)
  end

  test "visiting the index" do
    visit itinerarios_url
    assert_selector "h1", text: "Itinerarios"
  end

  test "creating a Itinerario" do
    visit itinerarios_url
    click_on "New Itinerario"

    click_on "Create Itinerario"

    assert_text "Itinerario was successfully created"
    click_on "Back"
  end

  test "updating a Itinerario" do
    visit itinerarios_url
    click_on "Edit", match: :first

    click_on "Update Itinerario"

    assert_text "Itinerario was successfully updated"
    click_on "Back"
  end

  test "destroying a Itinerario" do
    visit itinerarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Itinerario was successfully destroyed"
  end
end
