module Characterable
  extend ActiveSupport::Concern

  included do
    before_action :set_current_character
    before_action :require_character!, if: :require_character?
    helper_method :current_character

    # authorize :character, through: :current_character

    def current_character
      Current.character
    end

    def set_current_character(id = session[:current_character_id])
      session[:current_character_id] = id if session[:current_character_id] != id
      Current.character = Character.find_by(id:)
    end

    def remove_current_character
      session[:current_character_id] = nil
      Current.character = nil
    end

    def require_character!
      redirect_to characters_path if current_character.nil?
    end

    def require_character?
      return false if devise_controller?

      true
    end
  end

  class_methods do
    def skip_require_character!(*args, **kwargs)
      skip_before_action :require_character!, *args, **kwargs
    end
  end
end
