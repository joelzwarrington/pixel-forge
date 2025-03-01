class LocationsController < ApplicationController
  before_action :set_location, only: :show

  def index
    @locations = Location.all.to_a
    respond_with @locations
  end

  def show
    respond_with @location
  end

  private

  def set_location
    @location = Location.find(params.expect(:id))
  end
end
