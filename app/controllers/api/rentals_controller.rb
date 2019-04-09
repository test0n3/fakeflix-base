class Api::RentalsController < ApplicationController
  def index
    render json: Rental.all, status: :ok
  end

  def show
    render json: Rental.find(params[:id]), status: :ok
  end

  def movie
    movie = Movie.find(params[:id])
    Rental.create(
      paid_price: movie.price,
      rentable_type: "Movie",
      rentable_id: movie.id
    )
    render json: { message: "Movie Rental registered" }, status: :ok
  end

  def serie
    serie = Serie.find(params[:id])
    Rental.create(
      paid_price: serie.price,
      rentable_type: "Serie",
      rentable_id: serie.id
    )
    render json: { message: "Serie Rental registered" }, status: :ok
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end
end