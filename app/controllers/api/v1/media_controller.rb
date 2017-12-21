class Api::V1::MediaController < ApplicationController
  def create

  end

  private

  def media_params
    params.require(:media).permit(:link, :caption, :user_id, :board_id, :media_type)
  end
end
