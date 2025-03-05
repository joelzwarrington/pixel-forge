class HomeController < ApplicationController
  def show
    @character = current_character
    @equipment = @character.equipment
    @inventory = @character.inventory
    @location = @character.location
    @action = @character.actions.active.first
  end
end
