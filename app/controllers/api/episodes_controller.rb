class Api::EpisodesController < ApplicationController
  def show
    render json: Episode.find(params[:id]), status: :ok
  end
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
end
