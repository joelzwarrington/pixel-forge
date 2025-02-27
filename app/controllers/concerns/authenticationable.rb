module Authenticationable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :set_current_user, if: :user_signed_in?
  end

  def set_current_user
    Current.user = current_user
  end
end
