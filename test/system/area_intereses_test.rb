require "application_system_test_case"

class AreaInteresesTest < ApplicationSystemTestCase
  setup do
    @area_interes = area_intereses(:one)
  end

  test "visiting the index" do
    visit area_intereses_url
    assert_selector "h1", text: "Area Intereses"
  end

  test "creating a Area interes" do
    visit area_intereses_url
    click_on "New Area Interes"

    click_on "Create Area interes"

    assert_text "Area interes was successfully created"
    click_on "Back"
  end

  test "updating a Area interes" do
    visit area_intereses_url
    click_on "Edit", match: :first

    click_on "Update Area interes"

    assert_text "Area interes was successfully updated"
    click_on "Back"
  end

  test "destroying a Area interes" do
    visit area_intereses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Area interes was successfully destroyed"
  end
end
