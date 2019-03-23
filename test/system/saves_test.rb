require "application_system_test_case"

class SavesTest < ApplicationSystemTestCase
  setup do
    @safe = saves(:one)
  end

  test "visiting the index" do
    visit saves_url
    assert_selector "h1", text: "Saves"
  end

  test "creating a Save" do
    visit saves_url
    click_on "New Save"

    click_on "Create Save"

    assert_text "Save was successfully created"
    click_on "Back"
  end

  test "updating a Save" do
    visit saves_url
    click_on "Edit", match: :first

    click_on "Update Save"

    assert_text "Save was successfully updated"
    click_on "Back"
  end

  test "destroying a Save" do
    visit saves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Save was successfully destroyed"
  end
end
