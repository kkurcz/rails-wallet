require "application_system_test_case"

class WalletsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    # opens a screenshot of test result
    save_and_open_screenshot
    assert_selector "h1", text: "Your Wallets"
  end
end
