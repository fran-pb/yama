class User < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_secure_token

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
