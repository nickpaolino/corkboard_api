class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.create(user_params)
    payload = {user_id: user.id}
    token = issue_token(payload)
    render json: { id: user.id, username: user.username, jwt: token }
  end

  def show
    user = User.find(params[:id])
    render json: user.to_json(:include => {:board_users => {:include => :board}})
  end

  def index
    users = User.all
    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
