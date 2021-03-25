require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe print_text('FACTORY', color: :purple) do
    it 'has a valid factory' do
      expect(create(:movie))
    end
  end

  describe print_text('RELATIONSHIPS', color: :purple) do
    %w(character director producer).each do |role|
      base = "#{role}_movie_roles"
      it { should have_many(:"#{base}").dependent(:destroy) }
      it { should have_many(:"#{role.pluralize}") }
    end

    it { should have_one(:payment).dependent(:destroy) }
  end

  describe print_text('VALIDATIONS', color: :purple) do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:year) }
    it { should validate_numericality_of(:year).is_greater_than_or_equal_to(1960).is_less_than_or_equal_to(Date.current.year) }
  end
end
