class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :purpose
      t.string :type
      t.references :sender_wallet_id, null: false
      t.references :receiver_wallet_id, null: false

      t.timestamps
    end
    add_foreign_key :transactions, :wallets, column: :sender_wallet_id
    add_foreign_key :transactions, :wallets, column: :receiver_wallet_id
  end
end
