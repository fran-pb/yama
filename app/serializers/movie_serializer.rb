class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :year, :slug, :imdbid, :genre, :plot, :country

  has_many :characters, serializer: PersonSerializer, record_type: :person
  has_many :directors, serializer: PersonSerializer, record_type: :person
  has_many :producers, serializer: PersonSerializer, record_type: :person
end
