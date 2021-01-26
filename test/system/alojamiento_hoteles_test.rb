require "application_system_test_case"

class AlojamientoHotelesTest < ApplicationSystemTestCase
  setup do
    @alojamiento_hotel = alojamiento_hoteles(:one)
  end

  test "visiting the index" do
    visit alojamiento_hoteles_url
    assert_selector "h1", text: "Alojamiento Hoteles"
  end

  test "creating a Alojamiento hotel" do
    visit alojamiento_hoteles_url
    click_on "New Alojamiento Hotel"

    click_on "Create Alojamiento hotel"

    assert_text "Alojamiento hotel was successfully created"
    click_on "Back"
  end

  test "updating a Alojamiento hotel" do
    visit alojamiento_hoteles_url
    click_on "Edit", match: :first

    click_on "Update Alojamiento hotel"

    assert_text "Alojamiento hotel was successfully updated"
    click_on "Back"
  end

  test "destroying a Alojamiento hotel" do
    visit alojamiento_hoteles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Alojamiento hotel was successfully destroyed"
  end
end
