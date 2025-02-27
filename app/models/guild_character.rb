class GuildCharacter < ApplicationRecord
  belongs_to :guild
  belongs_to :character

  validates :character, uniqueness: { scope: :guild }
end
