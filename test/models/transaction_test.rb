require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "transfer money deducts correct amount from sender wallet" do
  #   user = User.new(email: "lisa@example.com", password: "123456")
  #   user.save!
  #   test_sender_wallet = Wallet.new(name: "Test Transfer Sender Wallet", balance: 500, user_id: user)
  #   test_sender_wallet.save!
  #   test_receiver_wallet = Wallet.new(name: "Test Transfer Receiver Wallet", balance: 200, user_id: user)
  #   test_receiver_wallet.save!
  #   transfer_transaction = Transaction.new(activity: "Transfer", amount: "500", purpose: "Transfer money test", sender_wallet_id: test_sender_wallet, receiver_wallet_id: test_receiver_wallet)
  #   transfer_transaction.save!
  #   # test_sender_wallet.balance == 0
  #   # test_receiver_wallet.balance == 700
    # transfer_transaction = Transaction.new(activity: "Transfer", amount: "500", purpose: "Transfer money test", sender_wallet_id: test_sender_wallet, receiver_wallet_id: test_receiver_wallet)

  # #   assert_equal "John Lennon", user.full_name
  #   assert_equal( 0, test_sender_wallet.balance )
  # end

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
