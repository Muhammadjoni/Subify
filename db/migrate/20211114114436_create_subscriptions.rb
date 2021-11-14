class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.string :username
      t.string :type
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.text :notes
      t.text :link
      t.boolean :notify
      t.integer :notify_before
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
