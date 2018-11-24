require "application_system_test_case"

class DesiresTest < ApplicationSystemTestCase
  setup do
    @desire = desires(:one)
  end

  test "visiting the index" do
    visit desires_url
    assert_selector "h1", text: "Desires"
  end

  test "creating a Desire" do
    visit desires_url
    click_on "New Desire"

    click_on "Create Desire"

    assert_text "Desire was successfully created"
    click_on "Back"
  end

  test "updating a Desire" do
    visit desires_url
    click_on "Edit", match: :first

    click_on "Update Desire"

    assert_text "Desire was successfully updated"
    click_on "Back"
  end

  test "destroying a Desire" do
    visit desires_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Desire was successfully destroyed"
  end
end
