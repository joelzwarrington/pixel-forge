class CharactersController < ApplicationController
  skip_require_character! only: %i[ index new choose create ]
  before_action :set_character, only: %i[ show edit choose update destroy ]

  def index
    @characters = Character.all

    respond_with @characters
  end

  def show
    respond_with @character
  end

  def new
    @character = Character.new

    respond_with @character
  end

  def edit
    respond_with @character
  end

  def choose
    set_current_character @character.id
    respond_with @character, location: -> { root_url }
  end

  def create
    @character = Character.new(character_params)
    @character.save

    respond_with @character
  end

  def update
    @character.update(character_params)

    respond_with @character
  end

  def destroy
    @character.destroy

    respond_with @character
  end

  private

  def set_character
    @character = Character.find(params.expect(:id))
  end

  def character_params
    params.expect(character: [ :name, :race_id, :location_id, :online ])
  end
end
