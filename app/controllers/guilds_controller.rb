class GuildsController < ApplicationController
  before_action :set_guild, only: %i[ show edit update destroy ]

  # GET /guilds
  def index
    @guilds = Guild.all
  end

  # GET /guilds/1
  def show
  end

  # GET /guilds/new
  def new
    @guild = Guild.new
  end

  # GET /guilds/1/edit
  def edit
  end

  # POST /guilds
  def create
    @guild = Guild.new(guild_params)

    if @guild.save
      redirect_to @guild, notice: "Guild was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guilds/1
  def update
    if @guild.update(guild_params)
      redirect_to @guild, notice: "Guild was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /guilds/1
  def destroy
    @guild.destroy!
    redirect_to guilds_path, notice: "Guild was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guild
      @guild = Guild.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def guild_params
      params.expect(guild: [ :name, :leader_id ])
    end
end
