class EquipmentController < ApplicationController
  before_action :set_character, only: %i[ show new create destroy ]
  before_action :set_equipment, only: %i[ show new create destroy ]

  def show
  end

  def new
  end

  # POST /equipment
  def create
    item = Item.find(params.expect(:item_id))
    @equipment.equip(params.expect(:slot), item)
    redirect_to [ @character, :equipment ], notice: "Item equipped.", status: :see_other
  end

  def destroy
    @equipment.unequip(params.expect(:slot))
    redirect_to [ @character, :equipment ], notice: "Item unequipped.", status: :see_other
  end

  private

  def set_character
    @character = Character.find(params.expect(:character_id))
  end

  def set_equipment
    @equipment = @character.equipment
  end
end
