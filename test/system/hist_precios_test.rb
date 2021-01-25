require "application_system_test_case"

class HistPreciosTest < ApplicationSystemTestCase
  setup do
    @hist_precio = hist_precios(:one)
  end

  test "visiting the index" do
    visit hist_precios_url
    assert_selector "h1", text: "Hist Precios"
  end

  test "creating a Hist precio" do
    visit hist_precios_url
    click_on "New Hist Precio"

    click_on "Create Hist precio"

    assert_text "Hist precio was successfully created"
    click_on "Back"
  end

  test "updating a Hist precio" do
    visit hist_precios_url
    click_on "Edit", match: :first

    click_on "Update Hist precio"

    assert_text "Hist precio was successfully updated"
    click_on "Back"
  end

  test "destroying a Hist precio" do
    visit hist_precios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hist precio was successfully destroyed"
  end
end
