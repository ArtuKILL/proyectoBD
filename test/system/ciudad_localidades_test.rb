require "application_system_test_case"

class CiudadLocalidadesTest < ApplicationSystemTestCase
  setup do
    @ciudad_localidad = ciudad_localidades(:one)
  end

  test "visiting the index" do
    visit ciudad_localidades_url
    assert_selector "h1", text: "Ciudad Localidades"
  end

  test "creating a Ciudad localidad" do
    visit ciudad_localidades_url
    click_on "New Ciudad Localidad"

    click_on "Create Ciudad localidad"

    assert_text "Ciudad localidad was successfully created"
    click_on "Back"
  end

  test "updating a Ciudad localidad" do
    visit ciudad_localidades_url
    click_on "Edit", match: :first

    click_on "Update Ciudad localidad"

    assert_text "Ciudad localidad was successfully updated"
    click_on "Back"
  end

  test "destroying a Ciudad localidad" do
    visit ciudad_localidades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ciudad localidad was successfully destroyed"
  end
end
