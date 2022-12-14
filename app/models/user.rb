class User < ApplicationRecord
  has_secure_password validations: true
  has_many :money_boxes
  has_many :fixed_costs
  has_many :pay_futures
  has_many :user_infos

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end
end
