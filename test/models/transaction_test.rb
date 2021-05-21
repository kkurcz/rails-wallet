require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  def setup
    @wallet = wallets(:kev_household_wallet)
    @sender_wallet = wallets(:kev_household_wallet)
    @receiver_wallet = wallets(:sara_business_wallet)
  end

  test 'valid transaction' do
    transfer_transaction = Transaction.new(id: 1, activity: "Transfer", purpose: "Transfer Test", amount: 500, receiver_wallet: @wallet, sender_wallet: @wallet)
    assert transfer_transaction.valid?, msg: "transfer transaction is invalid"
  end

  test 'Deposit money adds correct amount to wallet balance' do
    transfer_transaction = Transaction.new(activity: "Deposit", amount: "500", purpose: "Transfer money test", sender_wallet: @wallet, receiver_wallet: @wallet)
    assert_equal 1000, transfer_transaction.receiver_wallet.balance + 500, msg: "Deposit money test failed, deposit did not add the correct amount to wallet balance"
  end

  test 'Withdraw money adds correct amount to wallet balance' do
    transfer_transaction = Transaction.new(activity: "Withdrawal", amount: "500", purpose: "Transfer money test", sender_wallet: @wallet, receiver_wallet: @wallet)
    transfer_transaction.save!
    assert_equal 0, transfer_transaction.receiver_wallet.balance - 500, msg: "Withdraw money test failed, deposit did not add the correct amount to wallet balance"
  end

  test 'Transfer money adds correct amount to wallet balance' do
    sender_wallet = wallets(:kev_household_wallet)
    receiver_wallet = wallets(:sara_business_wallet)
    transfer_transaction = Transaction.new(activity: "Transfer", amount: "500", purpose: "Transfer money test", sender_wallet: @sender_wallet, receiver_wallet: @receiver_wallet)
    transfer_transaction.save!
    assert_equal 0, transfer_transaction.sender_wallet.balance - 500, msg: "Withdraw money test failed, sender wallet did not deduct the correct amount from wallet balance"
    assert_equal 1000, transfer_transaction.receiver_wallet.balance + 500, msg: "Withdraw money test failed, receiver wallet did not add the correct amount to wallet balance"
  end
end




