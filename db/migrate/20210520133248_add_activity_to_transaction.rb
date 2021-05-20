class AddActivityToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :activity, :string
  end
end
