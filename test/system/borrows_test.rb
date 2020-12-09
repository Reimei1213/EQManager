require "application_system_test_case"

class BorrowsTest < ApplicationSystemTestCase
  setup do
    @borrow = borrows(:one)
  end

  test "visiting the index" do
    visit borrows_url
    assert_selector "h1", text: "Borrows"
  end

  test "creating a Borrow" do
    visit borrows_url
    click_on "New Borrow"

    fill_in "Equip", with: @borrow.equip_id
    fill_in "Group user", with: @borrow.group_user_id
    fill_in "Return day", with: @borrow.return_day
    click_on "Create Borrow"

    assert_text "Borrow was successfully created"
    click_on "Back"
  end

  test "updating a Borrow" do
    visit borrows_url
    click_on "Edit", match: :first

    fill_in "Equip", with: @borrow.equip_id
    fill_in "Group user", with: @borrow.group_user_id
    fill_in "Return day", with: @borrow.return_day
    click_on "Update Borrow"

    assert_text "Borrow was successfully updated"
    click_on "Back"
  end

  test "destroying a Borrow" do
    visit borrows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Borrow was successfully destroyed"
  end
end
