require "application_system_test_case"

class SociosTest < ApplicationSystemTestCase
  setup do
    @socio = socios(:one)
  end

  test "visiting the index" do
    visit socios_url
    assert_selector "h1", text: "Socios"
  end

  test "creating a Socio" do
    visit socios_url
    click_on "New Socio"

    click_on "Create Socio"

    assert_text "Socio was successfully created"
    click_on "Back"
  end

  test "updating a Socio" do
    visit socios_url
    click_on "Edit", match: :first

    click_on "Update Socio"

    assert_text "Socio was successfully updated"
    click_on "Back"
  end

  test "destroying a Socio" do
    visit socios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Socio was successfully destroyed"
  end
end
