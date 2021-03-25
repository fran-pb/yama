require 'rails_helper'

RSpec.describe Person, type: :model do
  describe print_text('FACTORY', color: :purple) do
    it 'has a valid factory' do
      expect(build(:person))
    end
  end

  describe print_text('RELATIONSHIPS', color: :purple) do
    %w(character director producer).each do |role|
      base = "#{role}_movie_roles"
      it { should have_many(:"#{base}").dependent(:destroy) }
      it { should have_many(:"movies_as_#{role}") }
    end

    it { should have_many(:movie_roles).dependent(:destroy) }
    it { should have_many(:movies) }
  end

  describe print_text('VALIDATIONS', color: :purple) do
    subject { build(:person) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }  
    it { should validate_uniqueness_of(:first_name).scoped_to(:last_name) }
  end
end
