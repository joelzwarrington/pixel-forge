module Respondable
  extend ActiveSupport::Concern

  included do
    self.responder = ApplicationResponder

    respond_to :html
  end
end
