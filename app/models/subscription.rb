class Subscription < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  # validates :start_date,  presence: true
  # validates :notify_before,  presence: true


  CATEGORY = %W(Entertainment Education Finance Others)
  validates :category, inclusion: { in: CATEGORY }

  CURRENCY = %W(USD EUR AED GBP Unknown)
  validates :currency, inclusion: { in: CURRENCY }, presence: true, if: :price?

  SUB_TYPE = %W(weekly monthly three-months annual)
  validates :sub_type, inclusion: { in: SUB_TYPE }

  SUB_TYPES_TO_DAYS = {
    'weekly' => 7.days,
    'monthly' => 1.month,
    'three-months' => 3.months,
    'annual' => 1.year
  }.freeze

  after_save do
    if self.saved_change_to_start_date? || self.saved_change_to_notify_before? || self.saved_change_to_sub_type?
      self.end_date = self.start_date + SUB_TYPES_TO_DAYS[self.sub_type]
      self.notification_date = self.start_date + SUB_TYPES_TO_DAYS[self.sub_type] - self.notify_before>>>>> master
  
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
