class Api::V1::UsersController < SecuredController
  include ExceptionHandler
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate, only: [:index, :show]

  # GET /users
  def index
    users = User.order(:id)

    render json: UserSerializer.new(users), status: :ok
  end

  # POST /users
  def create
    user = User.create!(user_params)
    render json: UserSerializer.new(user), status: :created
  end

  # GET /users/:id
  def show
    render json: UserSerializer.new(@user), status: :ok
  end

  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

    def user_params
      params.permit(
        :first_name,
        :last_name
      )
    end

    def set_user
      @user = User.find(params[:id])
    end

end