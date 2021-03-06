class Api::V1::BoardsController < ApplicationController
  def create
    board = Board.create(board_params)
    usernames = params[:users]
    users = []
    usernames.each do |username|
      user = User.find_by(username: username)
      users << user
    end

    users.each do |user|
      user.boards << board
    end

    render json: board.format_board
  end

  def index
    boards = Board.all
    render json: boards
  end

  def show
    board = Board.find_by(id: params[:id])
    render json: board.format_board
  end

  def update
    board = Board.find_by(id: params[:id])
    users = params[:users]
    users.each do |user|
      user = User.find_by(username: user)
      board.users << user
    end

    render json: board.format_board
  end

  def destroy
    board = Board.find_by(id: params[:id])
    board.delete
    render json: board
  end

  private

  def board_params
    params.require(:board).permit(:subject, :public)
  end
end
