class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def show
    render json: {
      id: current_user.id,
      username: current_user.username
    }
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = issue_token(payload)
      render json: { id: user.id, username: user.username, jwt: token }
    else
      render json: { error: "some bad stuff happened"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
