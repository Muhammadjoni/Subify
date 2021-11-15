class AddCategoryToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :category, :string, array: true, default: []
  end
end
