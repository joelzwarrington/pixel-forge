class ApplicationController < ActionController::Base
  include Characterable

  allow_browser versions: :modern
end
