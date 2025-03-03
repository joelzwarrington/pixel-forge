class HomeController < ApplicationController
  def show
    @character = current_character
    @equipment = @character.equipment
    @inventory = @character.inventory
    @location = @character.location
    @node = @character.actions.active.first&.node
  end
end
