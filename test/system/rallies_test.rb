require "application_system_test_case"

class RalliesTest < ApplicationSystemTestCase
  setup do
    @rally = rallies(:one)
  end

  test "visiting the index" do
    visit rallies_url
    assert_selector "h1", text: "Rallies"
  end

  test "creating a Rally" do
    visit rallies_url
    click_on "New Rally"

    click_on "Create Rally"

    assert_text "Rally was successfully created"
    click_on "Back"
  end

  test "updating a Rally" do
    visit rallies_url
    click_on "Edit", match: :first

    click_on "Update Rally"

    assert_text "Rally was successfully updated"
    click_on "Back"
  end

  test "destroying a Rally" do
    visit rallies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rally was successfully destroyed"
  end
end
