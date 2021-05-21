require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "transfer money deducts and adds the correct amount from sender and receiver wallet" do
    test_sender_wallet = Wallet.new(name: "Test Transfer Sender Wallet", balance: 500)
    test_receiver_wallet = Wallet.new(name: "Test Transfer Receiver Wallet", balance: 200)
    transaction = Transaction.new(activity: "Transfer", amount: "500", purpose: "Transfer money test", sender_wallet: test_sender_wallet, receiver_wallet: test_receiver_wallet)
    # test_sender_wallet.balance == 0
    # test_receiver_wallet.balance == 700
  #   assert_equal "John Lennon", user.full_name
    assert_equal( 700, test_receiver_wallet.balance )
  end

  # def update_balance
  #   # raise
  #   if self.activity == 'Withdrawal'
  #     self.sender_wallet.balance -= self.amount
  #     self.sender_wallet.save
  #   elsif self.activity == 'Deposit'
  #     self.sender_wallet.balance += self.amount
  #     self.sender_wallet.save
  #   else
  #     self.sender_wallet.balance -= self.amount
  #     self.receiver_wallet.balance += self.amount
  #     self.sender_wallet.save
  #     self.receiver_wallet.save
  #   end
  # end
end
