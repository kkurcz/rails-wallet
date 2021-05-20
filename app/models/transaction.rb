class Transaction < ApplicationRecord
  belongs_to :sender_wallet, class_name: "Wallet"
  belongs_to :receiver_wallet, class_name: "Wallet"

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purpose, presence: true, length: { minimum: 1 }
  validates :type, inclusion: { in: ["Withdrawal", "Deposit", "Transfer"] }
end
