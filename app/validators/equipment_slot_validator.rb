class EquipmentSlotValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, item_id)
    unless Item.find(item_id).equipable_on?(slot = record.slot)
      record.errors.add attribute, (options[:message] || "is not equipable in #{slot}")
    end
  end
end
