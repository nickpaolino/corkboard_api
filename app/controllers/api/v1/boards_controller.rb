class Api::V1::BoardsController < ApplicationController
  def create
    board = Board.create(board_params)
    render json: board
  end

  def index
    boards = Board.all
    render json: boards
  end

  def show
    board = Board.find_by(id: params[:id])
    render json: board
  end

  private

  def board_params
    params.permit(:board).require(:subject, :public)
  end
end
