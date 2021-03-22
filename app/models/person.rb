class Person < ApplicationRecord
  has_many :movie_roles, dependent: :destroy
  has_many :movies, through: :movie_roles

  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
end
