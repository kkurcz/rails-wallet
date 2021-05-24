require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  def setup
    @wallet = wallets(:kev_household_wallet)
    @sender_wallet = wallets(:kev_household_wallet)
    @receiver_wallet = wallets(:sara_business_wallet)
    # .yml file for transactions didn't work due to sender and receiver wallet so wrote out the transactions here, should refactor:
    @deposit_transaction = Transaction.new(activity: "Deposit", amount: "500", purpose: "Transfer money test", sender_wallet: @wallet, receiver_wallet: @wallet)
    @withdrawal_transaction = Transaction.new(activity: "Withdrawal", amount: "500", purpose: "Transfer money test", sender_wallet: @wallet, receiver_wallet: @wallet)
    @transfer_transaction = Transaction.new(id: 1, activity: "Transfer", purpose: "Transfer Test", amount: 500, sender_wallet: @sender_wallet, receiver_wallet: @receiver_wallet)
    @insufficient_funds_withdrawal = Transaction.new(id: 1, activity: "Withdrawal", purpose: "Transfer Test", amount: 2000, sender_wallet: @sender_wallet, receiver_wallet: @receiver_wallet)
    @insufficient_funds_transfer = Transaction.new(id: 1, activity: "Transfer", purpose: "Transfer Test", amount: 2000, sender_wallet: @sender_wallet, receiver_wallet: @receiver_wallet)
  end

  test 'All transaction types are valid' do
    assert @deposit_transaction.valid?, msg: "deposit transaction is invalid"
    assert @withdrawal_transaction.valid?, msg: "withdraw transaction is invalid"
    assert @transfer_transaction.valid?, msg: "transfer transaction is invalid"
  end

  test 'Deposit money adds correct amount to wallet balance' do
    @deposit_transaction.update_balance
    assert_equal 1000, @deposit_transaction.receiver_wallet.balance, msg: "Deposit money test failed, deposit did not add the correct amount to wallet balance"
  end

  test 'Withdraw money adds correct amount to wallet balance' do
    @withdrawal_transaction.update_balance
    assert_equal 0, @withdrawal_transaction.receiver_wallet.balance, msg: "Withdraw money test failed, withrdawal did not deduct the correct amount to wallet balance"
  end

  test 'Transfer money adds correct amount to receiver wallet balance and deducts correct amount from sender wallet balance' do
    @transfer_transaction.update_balance
    assert_equal 0, @transfer_transaction.sender_wallet.balance, msg: "Transfer money test failed, sender wallet did not deduct the correct amount from wallet balance"
    assert_equal 1000, @transfer_transaction.receiver_wallet.balance, msg: "Transfer money test failed, receiver wallet did not add the correct amount to wallet balance"
  end

  test 'Withdrawal will not be processed if funds insufficient' do
    assert @insufficient_funds_withdrawal.funds_sufficient? == false, msg: "Withdrawal funds test failed, user can withdraw more money than wallet balance"
  end

  test 'Transfer will not be processed if funds insufficient' do
    assert @insufficient_funds_transfer.funds_sufficient? == false, msg: "Transfer funds test failed, user can transfer more money than wallet balance"
  end
end




