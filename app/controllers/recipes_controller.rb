class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show ]
  before_action :set_node, only: %i[ show ]
  before_action :set_location, only: %i[ show ]

  def show
  end

  private

  def set_recipe
    @recipe = Recipe.find(params.expect(:id))
  end

  def set_node
    @node = Node.find(params.expect(:node_id))
  end

  def set_location
    @location = Location.find(params.expect(:location_id))
  end
end
