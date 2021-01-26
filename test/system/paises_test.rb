require "application_system_test_case"

class PaisesTest < ApplicationSystemTestCase
  setup do
    @pais = paises(:one)
  end

  test "visiting the index" do
    visit paises_url
    assert_selector "h1", text: "Paises"
  end

  test "creating a Pais" do
    visit paises_url
    click_on "New Pais"

    click_on "Create Pais"

    assert_text "Pais was successfully created"
    click_on "Back"
  end

  test "updating a Pais" do
    visit paises_url
    click_on "Edit", match: :first

    click_on "Update Pais"

    assert_text "Pais was successfully updated"
    click_on "Back"
  end

  test "destroying a Pais" do
    visit paises_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pais was successfully destroyed"
  end
end
