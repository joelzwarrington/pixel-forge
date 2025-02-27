class GuildCharactersController < ApplicationController
  before_action :set_guild_character, only: %i[ show edit update destroy ]

  # GET /guild_characters
  def index
    @guild_characters = GuildCharacter.all
  end

  # GET /guild_characters/1
  def show
  end

  # GET /guild_characters/new
  def new
    @guild_character = GuildCharacter.new
  end

  # GET /guild_characters/1/edit
  def edit
  end

  # POST /guild_characters
  def create
    @guild_character = GuildCharacter.new(guild_character_params)

    if @guild_character.save
      redirect_to @guild_character, notice: "Guild character was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guild_characters/1
  def update
    if @guild_character.update(guild_character_params)
      redirect_to @guild_character, notice: "Guild character was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /guild_characters/1
  def destroy
    @guild_character.destroy!
    redirect_to guild_characters_path, notice: "Guild character was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guild_character
      @guild_character = GuildCharacter.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def guild_character_params
      params.expect(guild_character: [ :guild_id, :character_id, :role ])
    end
end
