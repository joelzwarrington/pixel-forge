class ActionsController < ApplicationController
  before_action :set_action, only: %i[ show edit update destroy ]

  respond_to :turbo_stream, only: %i[ create destroy ]

  def index
    @actions = Action.all

    respond_with @actions
  end

  def show
    respond_with @action
  end

  def new
    @action = Action.new

    respond_with @action
  end

  def edit
    respond_with @action
  end

  def create
    @action = Action.new(action_params)
    @action.save

    respond_with(@action) do |format|
      format.turbo_stream { flash.now[:notice] = "Action started" }
    end
  end

  def update
    @action.update(action_params)

    respond_with @action
  end

  def destroy
    @action.stop!

    respond_with(@action) do |format|
      format.turbo_stream { flash.now[:notice] = "Action stopped" }
    end
  end

  private

  def set_action
    @action = Action.find(params.expect(:id))
  end

  def action_params
    params.expect(node_action: [ :location_id, :node_id, :recipe_id ])
  end
end
