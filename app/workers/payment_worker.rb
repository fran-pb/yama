class PaymentWorker
  include Sidekiq::Worker
  require 'net/http'

  def perform(movie_id)
    # is just a simple example, in a real scenario the payment behavior and error handling
    # should be encapsulated and not carried out within the worker
    
    delay_seconds = rand(1000..10000)
    uri = URI("http://slowwly.robertomurray.co.uk/delay/#{delay_seconds}/url/https://www.google.com")

    response = Net::HTTP.get_response(uri)

    Payment.create(movie: Movie.find(movie_id), api_response_code: response.code, api_response_body: response.body)
  end
end
