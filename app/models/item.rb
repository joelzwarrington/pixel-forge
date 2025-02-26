class Item < FrozenRecord::Base
  def image_path
    "items/#{id}.png"
  end
end
