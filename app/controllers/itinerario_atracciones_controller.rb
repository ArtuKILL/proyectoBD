class ItinerarioAtraccionesController < ApplicationController
  before_action :set_itinerario_atraccion, only: [:show, :edit, :update, :destroy]
  before_action :set_agency
  before_action :set_paquete
  before_action :set_pais
  before_action :set_ciudad_localidad
  
  # GET /itinerario_atracciones
  # GET /itinerario_atracciones.json
  def index
    @itinerario_atracciones = ItinerarioAtraccion.all
  end

  # GET /itinerario_atracciones/1
  # GET /itinerario_atracciones/1.json
  def show
  end

  # GET /itinerario_atracciones/new
  def new
    @itinerario_atraccion = ItinerarioAtraccion.new
  end

  # GET /itinerario_atracciones/1/edit
  def edit
  end

  # POST /itinerario_atracciones
  # POST /itinerario_atracciones.json
  def create
    @itinerario_atraccion = ItinerarioAtraccion.new(itinerario_atraccion_params)

    respond_to do |format|
      if @itinerario_atraccion.save
        format.html { redirect_to agency_paquete_path(@agency, @paquete), notice: 'Itinerario atraccion was successfully created.' }
        format.json { render :show, status: :created, location: @itinerario_atraccion }
      else
        format.html { render :new }
        format.json { render json: @itinerario_atraccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinerario_atracciones/1
  # PATCH/PUT /itinerario_atracciones/1.json
  def update
    respond_to do |format|
      if @itinerario_atraccion.update(itinerario_atraccion_params)
        format.html { redirect_to @itinerario_atraccion, notice: 'Itinerario atraccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinerario_atraccion }
      else
        format.html { render :edit }
        format.json { render json: @itinerario_atraccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerario_atracciones/1
  # DELETE /itinerario_atracciones/1.json
  def destroy
    @itinerario_atraccion.destroy
    respond_to do |format|
      format.html { redirect_to itinerario_atracciones_url, notice: 'Itinerario atraccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerario_atraccion
      @itinerario_atraccion = ItinerarioAtraccion.find(params[:id])
    end

    def set_paquete
      @paquete = Paquete.find(params[:paquete_id])
    end
    
    def set_agency
      @agency = Agency.find(params[:agency_id])
    end
    
    def set_pais
      @pais = Pais.find(params[:pais_id])
    end

    def set_ciudad_localidad
      @ciudad_localidad = CiudadLocalidad.find(params[:ciudad_id])
    end


    # Only allow a list of trusted parameters through.
    def itinerario_atraccion_params
      params.fetch(:itinerario_atraccion).permit(:orden)
    end
end
