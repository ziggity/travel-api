class DestinationsController < ApplicationController

  def index
    if params[:city]
      @destinations = Destination.search(params[:city])
    elsif params[:country]
      @destinations = Destination.search_country(params[:country])
    elsif params[:most_popular]
       @destinations = Destination.popular_destinations
    elsif params[:get_random]
      @destinations = Destination.get_random
    else
      @result = []
      Destination.all.paginate(:page => params[:page], :per_page => 5).each do |destination|
        reviews = destination.reviews
        review_arr = destination.as_json(include: :reviews)
        @result << review_arr
      end
      @destinations = @result
    end
      json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    reviews = @destination.reviews
    json_response(@destination.as_json(include: :reviews))
  end

  def create
    @destination = Destination.create!(destination_params)
    json_response(@destination, :created)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
        message: "Destination deleted"
      }
      end
    end

  def destroy
    @destination = Destination.find(params[:id])
    if @destination.destroy!
      render status: 200, json: {
        message: "Destination deleted"
      }
    end
  end


  private
  def json_response(object)
    render json: object, status: :ok
  end

  def destination_params
    params.permit(:name, :country, :city, :review)
  end
end
