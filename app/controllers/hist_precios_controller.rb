class HistPreciosController < ApplicationController
  before_action :set_hist_precio, only: [:show, :edit, :update, :destroy]
  before_action :set_paquete
  before_action :set_agency

  # GET /hist_precios
  # GET /hist_precios.json
  def index
    @hist_precios = HistPrecio.all
  end

  # GET /hist_precios/1
  # GET /hist_precios/1.json
  def show
  end

  # GET /hist_precios/new
  def new
    @hist_precio = HistPrecio.new
  end

  # GET /hist_precios/1/edit
  def edit
  end

  # POST /hist_precios
  # POST /hist_precios.json
  def create
    @hist_precio = HistPrecio.new(hist_precio_params)

    respond_to do |format|
      if @hist_precio.save
        format.html { redirect_to @hist_precio, notice: 'Hist precio was successfully created.' }
        format.json { render :show, status: :created, location: @hist_precio }
      else
        format.html { render :new }
        format.json { render json: @hist_precio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hist_precios/1
  # PATCH/PUT /hist_precios/1.json
  def update
    respond_to do |format|
      if @hist_precio.update(hist_precio_params)
        format.html { redirect_to @hist_precio, notice: 'Hist precio was successfully updated.' }
        format.json { render :show, status: :ok, location: @hist_precio }
      else
        format.html { render :edit }
        format.json { render json: @hist_precio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hist_precios/1
  # DELETE /hist_precios/1.json
  def destroy
    @hist_precio.destroy
    respond_to do |format|
      format.html { redirect_to hist_precios_url, notice: 'Hist precio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hist_precio
      @hist_precio = HistPrecio.find(params[:id])
    end

    def set_paquete
      @paquete = Paquete.find(params[:paquete_id])
    end
    
    def set_agency
      @agency = Agency.find(params[:agency_id])
    end

    # Only allow a list of trusted parameters through.
    def hist_precio_params
      params.fetch(:hist_precio).permit(:)
    end
end
