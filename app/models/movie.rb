class Movie < ApplicationRecord

  %w(character director producer).each do |role|
    base = "#{role}_movie_roles"
    has_many :"#{base}", -> { where role: role }, class_name: 'MovieRole', dependent: :destroy
    has_many :"#{role.pluralize}", through: base, source: :person
  end

  has_one :payment, dependent: :destroy

  validates :title, :year, presence: true
  validates :year, numericality: {
    only_integer: true,
    greater_than: 1960,
    less_than_or_equal_to: Proc.new {|record| Date.current.year }
  }

  after_validation :set_slug, only: [:create, :update]

  # Force Rails to use both slug and ids instead of just the ids by overwriting the to_param method
  # Now we can find the record just by id and have a beautiful url, that’s work because in rails
  # find_by_id call to_i method and ruby only casts all numeric characters
  # e.g.
  # > "1-el-secreto-de-sus-ojos".to_i
  # => 1
  # > Movie.find("1-el-secreto-de-sus-ojos")

  def to_param
    "#{id}-#{slug}"
  end

  private  

  def set_slug
    self.slug = title.to_s.parameterize
  end 
end
