class Guild < ApplicationRecord
  has_many :guild_characters, dependent: :destroy
  has_many :characters, through: :guild_characters

  validates :name, presence: true

  before_create :build_default_associations

  private

  def build_default_associations
    guild_characters.build(character: Current.character, role: "owner")
  end
end
