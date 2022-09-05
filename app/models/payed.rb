class Payed < ApplicationRecord
  belongs_to :money_box

  validates :name, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
end
