class NodesController < ApplicationController
  before_action :set_node, only: %i[ show ]
  before_action :set_location, only: %i[ show ]

  def index
    @nodes = Node.all
  end

  def show
  end

  private

  def set_node
    @node = Node.find(params.expect(:id))
  end

  def set_location
    @location = Location.find(params.expect(:location_id))
  end
end
