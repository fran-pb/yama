class Payment < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates :movie_id, :user_id, :api_response_code, presence: true
end
