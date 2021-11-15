class Subscription < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :notify_before, presence: true

  CATEGORY = %W(Entertainment Education Finance Utility-Bills Others)
  validates :category, inclusion: { in: CATEGORY }

  CURRENCY = %W(USD EURO AED GBP Unknown)
  validates :currency, inclusion: { in: CURRENCY }, presence: true, if: :price?

  SUB_TYPE = %W(Weekly Monthly Annual)
  validates :sub_type, inclusion: { in: SUB_TYPE }
end
