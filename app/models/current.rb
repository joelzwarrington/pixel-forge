class Current < ActiveSupport::CurrentAttributes
  attribute :user, :character

  resets { Time.zone = nil }
end
