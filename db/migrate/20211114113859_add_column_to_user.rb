class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :sms_number, :text
    add_column :users, :whatsapp_number, :text
  end
end
