require "application_system_test_case"

class AtraccionesTest < ApplicationSystemTestCase
  setup do
    @atraccion = atracciones(:one)
  end

  test "visiting the index" do
    visit atracciones_url
    assert_selector "h1", text: "Atracciones"
  end

  test "creating a Atraccion" do
    visit atracciones_url
    click_on "New Atraccion"

    click_on "Create Atraccion"

    assert_text "Atraccion was successfully created"
    click_on "Back"
  end

  test "updating a Atraccion" do
    visit atracciones_url
    click_on "Edit", match: :first

    click_on "Update Atraccion"

    assert_text "Atraccion was successfully updated"
    click_on "Back"
  end

  test "destroying a Atraccion" do
    visit atracciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Atraccion was successfully destroyed"
  end
end
