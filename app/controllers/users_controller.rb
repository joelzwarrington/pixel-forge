class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]

  def index
    @users = User.all
  end

  def show
  end

  private

  def set_user
    @user = User.find(params.expect(:id))
  end

  def user_params
    params.fetch(:user, {})
  end
end
