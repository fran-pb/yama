class Payment < ApplicationRecord
  belongs_to :movie
  validates :api_response_code, presence: true
end
