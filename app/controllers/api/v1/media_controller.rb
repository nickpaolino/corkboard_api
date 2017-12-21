class Api::V1::MediaController < ApplicationController
  def create
    medium = Medium.create(media_params)
    render json: medium
  end

  def update
    medium = Medium.find_by(id: params[:medium][:id])
    medium.update(left_position: params[:left_position], top_position: params[:top_position])
    render json: medium
  end

  private

  def media_params
    params.require(:medium).permit(:link, :caption, :user_id, :board_id, :media_type, :left_position, :top_position)
  end
end
