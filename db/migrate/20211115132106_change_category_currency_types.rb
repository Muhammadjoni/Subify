class ChangeCategoryCurrencyTypes < ActiveRecord::Migration[6.0]
  def change
    change_column :subscriptions, :category, :string, array: false, default: nil
    change_column :subscriptions, :currency, :string, array: false, default: nil
  end
end
