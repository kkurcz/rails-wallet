require "application_system_test_case"

class WalletsTest < ApplicationSystemTestCase
  test "visiting the index" do
    login_as users(:kev)
    visit root_url

    # opens a screenshot of test result
    save_and_open_screenshot
    assert_selector "h1", text: "Your Wallets"
  end

  test "lets a signed in user create a new wallet" do
    login_as users(:kev)
    visit "/wallets/new"
    save_and_open_screenshot

    fill_in "wallet_name", with: "Litecoin Wallet"
    save_and_open_screenshot

    click_on 'Create Wallet'
    save_and_open_screenshot

    # Should be redirected to show page with new product
    # assert_equal wallet_path(wallet), page.current_path
    assert_selector "h5", text: "Current Balance: $0"
  end
end
