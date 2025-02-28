class ApplicationController < ActionController::Base
  include Authenticationable, Characterable, Respondable

  default_form_builder AtomicView::FormBuilder

  allow_browser versions: :modern
end
