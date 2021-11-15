class AddCurrencyToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :currency, :string, array: true, default: []
  end
end
