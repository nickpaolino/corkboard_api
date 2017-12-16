class Api::V1::BoardUsersController < ApplicationController
  skip_before_action :authorized, only: [:index]
  def index
    render json: {hi: "test"}
  end
end
