class AddImageUrlToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :image_url, :string
  end
end
