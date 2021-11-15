class Subscription < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :sub_type, presence: true
  validates :notify_before, presence: true
end
