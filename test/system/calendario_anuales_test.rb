require "application_system_test_case"

class CalendarioAnualesTest < ApplicationSystemTestCase
  setup do
    @calendario_anual = calendario_anuales(:one)
  end

  test "visiting the index" do
    visit calendario_anuales_url
    assert_selector "h1", text: "Calendario Anuales"
  end

  test "creating a Calendario anual" do
    visit calendario_anuales_url
    click_on "New Calendario Anual"

    click_on "Create Calendario anual"

    assert_text "Calendario anual was successfully created"
    click_on "Back"
  end

  test "updating a Calendario anual" do
    visit calendario_anuales_url
    click_on "Edit", match: :first

    click_on "Update Calendario anual"

    assert_text "Calendario anual was successfully updated"
    click_on "Back"
  end

  test "destroying a Calendario anual" do
    visit calendario_anuales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Calendario anual was successfully destroyed"
  end
end
