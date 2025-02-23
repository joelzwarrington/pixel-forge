class InventoryItemsController < ApplicationController
  before_action :set_inventory_item, only: %i[ show edit update destroy ]

  # GET /inventory_items
  def index
    @inventory_items = InventoryItem.all
  end

  # GET /inventory_items/1
  def show
  end

  # GET /inventory_items/new
  def new
    @inventory_item = InventoryItem.new
  end

  # GET /inventory_items/1/edit
  def edit
  end

  # POST /inventory_items
  def create
    @inventory_item = InventoryItem.new(inventory_item_params)

    if @inventory_item.save
      redirect_to @inventory_item, notice: "Inventory item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventory_items/1
  def update
    if @inventory_item.update(inventory_item_params)
      redirect_to @inventory_item, notice: "Inventory item was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /inventory_items/1
  def destroy
    @inventory_item.destroy!
    redirect_to inventory_items_path, notice: "Inventory item was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item
      @inventory_item = InventoryItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def inventory_item_params
      params.expect(inventory_item: [ :character_id, :item_id, :quantity, :weight ])
    end
end
