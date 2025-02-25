class ActionsController < ApplicationController
  before_action :set_character, only: %i[ show create destroy ]
  before_action :set_action, only: %i[ show destroy ]

  def show
    redirect_to @character if @action.nil?
  end

  def create
    node = Node.find(params.expect(:node_id))

    if (@action = ActionManager.begin(@character, node))
      redirect_to [ @character, :action ], notice: "Action was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    ActionManager.end(@character)
    redirect_to @character, notice: "Action was stopped.", status: :see_other
  end

  private

  def set_character
    @character = Character.find(params.expect(:character_id))
  end

  def set_action
    @action = ActionManager.active_for(@character)
  end

  def action_params
    params.expect(action: [ :node_id ])
  end
end
