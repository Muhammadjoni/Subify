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

    t = { "weekly" => 1.week, "monthly" => 1.month, "three_months" => 3.month, "annual" => 1.year }

    if self.saved_change_to_start_date? || self.saved_change_to_notify_before? || self.saved_change_to_sub_type?
      if self.sub_type[0]
        self.notification_date = self.start_date + t[:weekly] - self.notify_before
      elsif self.sub_type[1]
        self.notification_date = self.start_date + t[:monthly] - self.notify_before
      elsif self.sub_type[2]
        self.notification_date = self.start_date + t[:three_months] - self.notify_before
      elsif self.sub_type[3]
        self.notification_date = self.start_date + t[:annual] - self.notify_before
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
