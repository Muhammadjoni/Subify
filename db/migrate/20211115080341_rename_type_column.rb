class RenameTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :subscriptions, :type, :sub_type
  end
end
