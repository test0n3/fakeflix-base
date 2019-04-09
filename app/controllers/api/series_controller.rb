class Api::SeriesController < ApplicationController
  def index
    if params.key? "filter"
      render json: Serie.where(status: params[:filter]), status: :ok
    else
      render json: Serie.all, status: :ok
    end
  end

  def show
    render json: Serie.find(params[:id]), status: :ok
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
end