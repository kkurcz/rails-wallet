class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transactions #, dependent: :destroy -> need to fix wallets destroy first

  validates :balance, presence: true
  validates :name, uniqueness: true, length: { minimum: 1 }
  after_initialize :set_defaults, unless: :persisted?
  # Set default balance to 0

  def set_defaults
    self.balance  ||= 0
  end
end
