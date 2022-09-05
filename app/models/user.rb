class User < ApplicationRecord
  has_many :money_boxes
  has_many :pay_futures
  has_many :fixed_costs
end
