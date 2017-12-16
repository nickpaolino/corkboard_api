class BoardsController < ApplicationController
  def create
    board = Board.create(board_params)
  end

  private

  def board_params
    params.permit(:board).require(:subject, :public)
  end
end
