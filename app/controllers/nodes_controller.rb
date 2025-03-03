class NodesController < ApplicationController
  before_action :set_node, only: %i[ show edit update destroy ]

  # GET /nodes
  def index
    @nodes = Node.all
  end

  # GET /nodes/1
  def show
  end

  # GET /nodes/new
  def new
    @node = Node.new
  end

  # GET /nodes/1/edit
  def edit
  end

  # POST /nodes
  def create
    @node = Node.new(node_params)

    if @node.save
      redirect_to @node, notice: "Node was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nodes/1
  def update
    if @node.update(node_params)
      redirect_to @node, notice: "Node was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /nodes/1
  def destroy
    @node.destroy!
    redirect_to nodes_path, notice: "Node was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node
      @node = Node.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def node_params
      params.fetch(:node, {})
    end
end
