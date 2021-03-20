class Person < ApplicationRecord
  has_many :movie_roles
  has_many :movies, through: :movie_roles

  validates :first_name, :last_name, presence: true
end
