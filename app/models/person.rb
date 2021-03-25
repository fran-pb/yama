class Person < ApplicationRecord
  %w(character director producer).each do |role|
    base = "#{role}_movie_roles"
    has_many :"#{base}", -> { where role: role }, class_name: 'MovieRole', dependent: :destroy
    has_many :"movies_as_#{role}", through: base, source: :person
  end

  has_many :movie_roles, dependent: :destroy
  has_many :movies, through: :movie_roles

  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
end
