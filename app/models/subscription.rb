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

  after_save do


    if self.saved_change_to_start_date? || self.saved_change_to_notify_before? || self.saved_change_to_sub_type?
      if self.sub_type[0]
        self.notification_date = self.start_date + 7.days - self.notify_before
      elsif self.sub_type[1]
        self.notification_date = self.start_date + 1.month - self.notify_before
      elsif self.sub_type[2]
        self.notification_date = self.start_date + 3.month - self.notify_before
      elsif self.sub_type[3]
        self.notification_date = self.start_date + 1.year - self.notify_before
      else
        self.notification_date = self.end_date - self.notify_before
      end
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
