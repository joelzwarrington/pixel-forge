class EquipmentItemsController < ApplicationController
  before_action :set_equipment_item, only: %i[ show edit update destroy ]

  # GET /equipment_items
  def index
    @equipment_items = EquipmentItem.all
  end

  # GET /equipment_items/1
  def show
  end

  # GET /equipment_items/new
  def new
    @equipment_item = EquipmentItem.new
  end

  # GET /equipment_items/1/edit
  def edit
  end

  # POST /equipment_items
  def create
    @equipment_item = EquipmentItem.new(equipment_item_params)

    if @equipment_item.save
      redirect_to @equipment_item, notice: "Equipment item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipment_items/1
  def update
    if @equipment_item.update(equipment_item_params)
      redirect_to @equipment_item, notice: "Equipment item was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /equipment_items/1
  def destroy
    @equipment_item.destroy!
    redirect_to equipment_items_path, notice: "Equipment item was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_item
      @equipment_item = EquipmentItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def equipment_item_params
      params.expect(equipment_item: [ :character_id, :item_id, :slot ])
    end
end
