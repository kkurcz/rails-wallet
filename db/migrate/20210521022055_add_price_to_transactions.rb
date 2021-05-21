class AddPriceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_monetize :transactions, :price
  end
end
