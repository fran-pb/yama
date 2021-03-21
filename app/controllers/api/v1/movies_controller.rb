class Api::V1::MoviesController < ActionController::API
  include ExceptionHandler
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /movies
  def index
    movies = Movie.order(:id).includes([:directors, :producers, :characters])
    
    render json: movies.to_json(
      except: [ :created_at, :updated_at ],
      include: [
        directors: { except: [ :created_at, :updated_at ] },
        producers: { except: [ :created_at, :updated_at ] },
        characters: { except: [ :created_at, :updated_at ] }
      ]
    ), status: :ok
  end

  # POST /movies
  def create
    @movie = Movie.create!(movie_params)
    PaymentWorker.perform_async(@movie.id)
    render json: @movie.to_json(except: [ :created_at, :updated_at ]), status: :created
  end

  # GET /movies/:id
  def show
    render json: @movie.to_json(except: [ :created_at, :updated_at ]), status: :ok
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