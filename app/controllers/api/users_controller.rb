class Api::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy, :current_user, :addConnection]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def currentUser
    render json: @current_user
  end

  def userConnections
    render json: @current_user.connected_users
  end

  def userConnectionsIds
  	# Builds a list of ids the user is connected with to assist with forming new connections
  	connectionIds = @current_user.connected_users.map do |user|
  		user.id
  	end
  	# Include own id, because can't be connected to yourself
  	connectionIds << @current_user.id

    render json: connectionIds
  end

  def addConnection
  	userToConnect = User.find_by(id: params[:connection])
  	if(userToConnect != @current_user) {
      @current_user.connected_users << userToConnect

      render status: 200
    } else {
      render status: 400
    }
  end

  def currentUser_posts
  	@posts = @current_user.posts.order('created_at DESC')
  	render json: @posts
  end

  def user_posts
  	user = User.find_by(id: params[:user_id])

  	render json: user.posts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:login, :name)
    end
end
