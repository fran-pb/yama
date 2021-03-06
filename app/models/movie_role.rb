class MovieRole < ApplicationRecord
  belongs_to :movie
  belongs_to :person

  validates :person, :movie, :role, presence: true
  validates :movie, uniqueness: { scope: %i[person_id role] }
end
