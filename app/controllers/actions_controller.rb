class ActionsController < ApplicationController
  before_action :set_character, only: %i[ show new create destroy ]
  before_action :set_action, only: %i[ show edit update destroy ]

  def show
    redirect_to @character if @action.nil?
  end

  def new
    @action = Action.new
  end

  def create
    node = Node.find(params.expect(:node_id))

    if (@action = ActionManager.begin(@character, node))
      redirect_to [ @character, :action ], notice: "Action was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /actions/1
  def update
    if @action.update(action_params)
      redirect_to @action, notice: "Action was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /actions/1
  def destroy
    @action.destroy!
    redirect_to actions_path, notice: "Action was successfully destroyed.", status: :see_other
  end

  private

  def set_character
    @character = Character.find(params.expect(:character_id))
  end

  def set_action
    @action = @character.actions.active.first
  end

  def action_params
    params.expect(action: [ :node_id ])
  end
end
