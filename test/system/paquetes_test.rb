require "application_system_test_case"

class PaquetesTest < ApplicationSystemTestCase
  setup do
    @paquete = paquetes(:one)
  end

  test "visiting the index" do
    visit paquetes_url
    assert_selector "h1", text: "Paquetes"
  end

  test "creating a Paquete" do
    visit paquetes_url
    click_on "New Paquete"

    click_on "Create Paquete"

    assert_text "Paquete was successfully created"
    click_on "Back"
  end

  test "updating a Paquete" do
    visit paquetes_url
    click_on "Edit", match: :first

    click_on "Update Paquete"

    assert_text "Paquete was successfully updated"
    click_on "Back"
  end

  test "destroying a Paquete" do
    visit paquetes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Paquete was successfully destroyed"
  end
end
