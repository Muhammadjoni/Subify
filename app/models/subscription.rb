class Subscription < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :notify_before, presence: true

  CATEGORY = %W(Entertainment Education Finance Others)
  validates :category, inclusion: { in: CATEGORY }

  CURRENCY = %W(USD EURO AED GBP Unknown)
  validates :currency, inclusion: { in: CURRENCY }, presence: true, if: :price?

  SUB_TYPE = %W(weekly monthly three-month annual)
  validates :sub_type, inclusion: { in: SUB_TYPE }

  SUB_TYPES_TO_DAYS = {
    'weekly' => [7.days, 7],
    'monthly' => [1.month, 30],
    'three-month' => [3.months, 90],
    'annual' => [1.year, 365]
  }.freeze

  after_save do
    if self.saved_change_to_start_date? || self.saved_change_to_notify_before? || self.saved_change_to_sub_type?
      difference_with_today = (Date.today - self.start_date).to_i / SUB_TYPES_TO_DAYS[self.sub_type].last
      additive_value = (Date.today.day - self.start_date.day).positive? ? 1 : 0
      self.end_date = self.start_date + SUB_TYPES_TO_DAYS[self.sub_type].first
      self.notification_date = self.start_date + (SUB_TYPES_TO_DAYS[self.sub_type].first * (difference_with_today + additive_value)) - self.notify_before


      self.save
    end
  end

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :title, :category ],
    using: {
      tsearch: { prefix: true }
    }
end
