require 'rails_helper'

RSpec.describe User, type: :model do
  describe print_text('FACTORY', color: :purple) do
    it 'has a valid factory' do
      expect(build(:user))
    end
  end

  describe print_text('RELATIONSHIPS', color: :purple) do
    it { should have_many(:payments).dependent(:destroy) }
  end

  describe print_text('VALIDATIONS', color: :purple) do
    subject { build(:user) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }  
  end
end
