class ConstructionResourcesController < ApplicationController
  before_action :set_construction_resource, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /construction_resources or /construction_resources.json
  def index
    @construction_resources = ConstructionResource.all
  end

  # GET /construction_resources/1 or /construction_resources/1.json
  def show
  end

  # GET /construction_resources/new
  def new
    @construction_resource = ConstructionResource.new
  end

  # GET /construction_resources/1/edit
  def edit
  end

  # POST /construction_resources or /construction_resources.json
  def create
    @construction_resource = ConstructionResource.new(construction_resource_params)

    respond_to do |format|
      if @construction_resource.save
        format.html { redirect_to construction_resource_url(@construction_resource), notice: "Construction resource was successfully created." }
        format.json { render :show, status: :created, location: @construction_resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @construction_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /construction_resources/1 or /construction_resources/1.json
  def update
    respond_to do |format|
      if @construction_resource.update(construction_resource_params)
        format.html { redirect_to construction_resource_url(@construction_resource), notice: "Construction resource was successfully updated." }
        format.json { render :show, status: :ok, location: @construction_resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @construction_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /construction_resources/1 or /construction_resources/1.json
  def destroy
    @construction_resource.destroy

    respond_to do |format|
      format.html { redirect_to construction_resources_url, notice: "Construction resource was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction_resource
      @construction_resource = ConstructionResource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def construction_resource_params
      params.require(:construction_resource).permit(:resource_id, :construction_id, :quantity)
    end
end
