class Api::V1::MoviesController < SecuredController
  include ExceptionHandler
  before_action :set_movie, only: [:show, :update, :destroy]
  skip_before_action :authenticate, only: [:index, :show]

  # GET /movies
  def index
    movies = Movie.order(:id).includes([:directors, :producers, :characters])

    render json: MovieSerializer.new(movies), status: :ok
  end

  # POST /movies
  def create
    movie = Movie.create!(movie_params)
    PaymentWorker.perform_async(movie.id, current_user.id)
    render json: MovieSerializer.new(movie), status: :created
  end

  # GET /movies/:id
  def show
    render json: MovieSerializer.new(@movie), status: :ok
  end

  # PUT /movies/:id
  def update
    @movie.update(movie_params)
    head :no_content
  end

  # DELETE /movies/:id
  def destroy
    @movie.destroy
    head :no_content
  end

  private

    def movie_params
      params.permit(
        :title,
        :year,
        :imdbid,
        :genre,
        :plot,
        :country
      )
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

end