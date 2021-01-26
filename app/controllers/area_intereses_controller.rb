class AreaInteresesController < ApplicationController
  before_action :set_area_interes, only: [:show, :edit, :update, :destroy]
  before_action :set_agency

  # GET /area_intereses
  # GET /area_intereses.json
  def index
    @area_intereses = AreaInteres.all
  end

  # GET /area_intereses/1
  # GET /area_intereses/1.json
  def show
  end

  # GET /area_intereses/new
  def new
    @area_interes = AreaInteres.new
  end

  # GET /area_intereses/1/edit
  def edit
  end

  # POST /area_intereses
  # POST /area_intereses.json
  def create
    @area_interes = AreaInteres.new(area_interes_params)

    respond_to do |format|
      if @area_interes.save
        format.html { redirect_to @area_interes, notice: 'Area interes was successfully created.' }
        format.json { render :show, status: :created, location: @area_interes }
      else
        format.html { render :new }
        format.json { render json: @area_interes.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_intereses/1
  # PATCH/PUT /area_intereses/1.json
  def update
    respond_to do |format|
      if @area_interes.update(area_interes_params)
        format.html { redirect_to @area_interes, notice: 'Area interes was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_interes }
      else
        format.html { render :edit }
        format.json { render json: @area_interes.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_intereses/1
  # DELETE /area_intereses/1.json
  def destroy
    @area_interes.destroy
    respond_to do |format|
      format.html { redirect_to area_intereses_url, notice: 'Area interes was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_interes
      @area_interes = AreaInteres.find(params[:id])
    end
    
    def set_agency
      @agency = Agency.find(params[:agency_id])
    end


    # Only allow a list of trusted parameters through.
    def area_interes_params
      params.fetch(:area_interes).permit(:categoria_interes, :descripcion_interes)
    end
end
