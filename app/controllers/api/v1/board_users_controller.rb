class Api::V1::BoardUsersController < ApplicationController

  def index
    render json: {hi: "test"}
  end

  def update
    board_user = BoardUser.find_by(id: params[:id])
    board_user.update(left_position: params[:left_position], top_position: params[:top_position])
    render json: board_user
  end

  def change
    board_user = BoardUser.find_by(board_id: params[:board_id], user_id: params[:user_id])
    board_user.update(left_position: params[:left_position], top_position: params[:top_position])
    render json: board_user
  end

  def show
  end
end
