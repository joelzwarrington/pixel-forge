class Current < ActiveSupport::CurrentAttributes
  attribute :character

  resets { Time.zone = nil }
end
