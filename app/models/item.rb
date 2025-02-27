class Item < FrozenRecord::Base
  def image_path
    "items/#{id}.png"
  end

  def equipable_on?(slot)
    return false unless equipable_on.present?

    equipable_on[slot] || false
  end
end
