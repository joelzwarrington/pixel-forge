class ApplicationController < ActionController::Base
  include Authenticationable, Characterable

  default_form_builder AtomicView::FormBuilder

  allow_browser versions: :modern
end
