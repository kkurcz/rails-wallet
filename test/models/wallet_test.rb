require 'test_helper'

class WalletTest < ActiveSupport::TestCase
  def setup
    @wallet = wallets(:kev_household_wallet)
  end

  test 'valid wallet' do
    assert @wallet.valid?
  end

  test 'invalid without balance' do
    @wallet.balance = nil
    refute @wallet.valid?, 'saved wallet without an amount'
    assert_not_nil @wallet.errors[:amount], 'no validation error for amount present'
  end
end
