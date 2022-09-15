class MoneyBox < ApplicationRecord
  has_many :payeds
  belongs_to :user
  has_one_attached :image
end
