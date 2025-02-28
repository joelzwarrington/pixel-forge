class ApplicationResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder

  self.error_status = :unprocessable_entity
  self.redirect_status = :see_other

  alias_method :to_turbo_stream, :to_html
end
