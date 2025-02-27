class CharactersController < ApplicationController
  skip_require_character! only: %i[ index new choose create ]
  before_action :set_character, only: %i[ show edit choose update destroy ]

  def index
    @characters = Character.all
  end

  def show
  end

  def new
    @character = Character.new
  end

  def edit
  end

  def choose
    set_current_character @character.id
    redirect_to root_url
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character, notice: "Character was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @character.update(character_params)
      redirect_to @character, notice: "Character was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @character.destroy!
    redirect_to characters_path, notice: "Character was successfully destroyed.", status: :see_other
  end

  private

  def set_character
    @character = Character.find(params.expect(:id))
  end

  def character_params
    params.expect(character: [ :name, :race_id, :location_id, :online ])
  end
end
