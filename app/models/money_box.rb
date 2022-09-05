class MoneyBox < ApplicationRecord
  has_many :payeds
  belongs_to :user
end
