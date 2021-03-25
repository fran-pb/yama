require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe print_text('FACTORY', color: :purple) do
    it 'has a valid factory' do
      expect(build(:payment))
    end
  end

  describe print_text('RELATIONSHIPS', color: :purple) do
    it { should belong_to(:movie) }
    it { should belong_to(:user) }
  end

  describe print_text('VALIDATIONS', color: :purple) do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:api_response_code) }  
  end
end
