class AddNotificationDateToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :notification_date, :date
  end
end
