class AddTrialToSubscitpions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :trial, :integer, default: 7
  end
end
