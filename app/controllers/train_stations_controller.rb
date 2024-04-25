class TrainStationsController < ApplicationController
  def index
    if params[:query].present?
      @train_stations = TrainStation.search(params[:query])
    else
      @train_stations = TrainStation.all
    end
  end
end
