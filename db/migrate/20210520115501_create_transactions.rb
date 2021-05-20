class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :purpose
      t.string :type
      t.references :sender_wallet, null: false, foreign_key: true
      t.references :receiver_wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
