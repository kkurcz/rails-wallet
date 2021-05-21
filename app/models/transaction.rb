class Transaction < ApplicationRecord
  belongs_to :sender_wallet, class_name: "Wallet"
  belongs_to :receiver_wallet, class_name: "Wallet"

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purpose, presence: true, length: { minimum: 1 }
  validates :activity, inclusion: { in: ["Withdrawal", "Deposit", "Transfer"] }

  # shows currency of transaction (currently set to USD)
  monetize :price_cents

  def update_balance
    # raise
    # update the transaction wallet(s) balance depending on transaction activity
    if self.activity == 'Withdrawal'
      self.sender_wallet.balance -= self.amount
    elsif self.activity == 'Deposit'
      self.sender_wallet.balance += self.amount
    else
      self.sender_wallet.balance -= self.amount
      self.receiver_wallet.balance += self.amount
    end
    # save new wallet balance
    self.sender_wallet.save
    self.receiver_wallet.save
  end

  def funds_sufficient?
    # check if wallet has enough funds to perform transaction
    self.amount <= self.sender_wallet.balance || self.activity == "Deposit"
  end
end
