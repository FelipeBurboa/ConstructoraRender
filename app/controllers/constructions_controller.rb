class ConstructionsController < ApplicationController
  before_action :set_construction, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /constructions or /constructions.json
  def index
    @constructions = Construction.all
  end

  # GET /constructions/1 or /constructions/1.json
  def show
    @consctructionresources = ConstructionResource.all
  end

  # GET /constructions/new
  def new
    @construction = Construction.new
    @resources = Resource.all
  end

  # GET /constructions/1/edit
  def edit
    @resources = Resource.all
  end

  # POST /constructions or /constructions.json
  def create
    @construction = Construction.new(construction_params)

    respond_to do |format|
      if @construction.save
        @construction.addQuantity(params[:construction][:resources_quantity]) #test
        format.html { redirect_to construction_url(@construction), notice: "Construction was successfully created." }
        format.json { render :show, status: :created, location: @construction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @construction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constructions/1 or /constructions/1.json
  def update
    respond_to do |format|
      if @construction.update(construction_params)
        @construction.addQuantity(params[:construction][:resources_quantity]) #test
        format.html { redirect_to construction_url(@construction), notice: "Construction was successfully updated." }
        format.json { render :show, status: :ok, location: @construction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @construction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constructions/1 or /constructions/1.json
  def destroy
    @construction.destroy

    respond_to do |format|
      format.html { redirect_to constructions_url, notice: "Construction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction
      @construction = Construction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def construction_params
      params.require(:construction).permit(:name, :startdate, :enddate, :cost, :street, :number, :city, :state, :postcode,{resource_ids: []})
    end
end
