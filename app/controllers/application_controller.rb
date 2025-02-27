class ApplicationController < ActionController::Base
  include Authenticationable, Characterable

  allow_browser versions: :modern
end
