class Api::V1::PeopleController < SecuredController
  include ExceptionHandler
  before_action :set_person, only: [:show, :update, :destroy]
  skip_before_action :authenticate, only: [:index, :show]

  # GET /people
  def index
    people = Person.order(:id)

    render json: PersonSerializer.new(people), status: :ok
  end

  # POST /people
  def create
    person = Person.create!(person_params)
    render json: PersonSerializer.new(person), status: :created
  end

  # GET /people/:id
  def show
    render json: PersonSerializer.new(@person), status: :ok
  end

  # PUT /people/:id
  def update
    @person.update(person_params)
    head :no_content
  end

  # DELETE /people/:id
  def destroy
    @person.destroy
    head :no_content
  end

  private

    def person_params
      params.permit(
        :first_name,
        :last_name
      )
    end

    def set_person
      @person = Person.find(params[:id])
    end

end