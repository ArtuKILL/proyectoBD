class ItinerariosController < ApplicationController
  before_action :set_itinerario, only: [:show, :edit, :update, :destroy]
  before_action :set_agency
  before_action :set_paquete
  before_action :set_ciudad_localidad
  before_action :set_pais

  # GET /itinerarios
  # GET /itinerarios.json
  def index
    @itinerarios = Itinerario.all
  end

  # GET /itinerarios/1
  # GET /itinerarios/1.json
  def show
  end

  # GET /itinerarios/new
  def new
    @itinerario = Itinerario.new
  end

  # GET /itinerarios/1/edit
  def edit
  end

  # POST /itinerarios
  # POST /itinerarios.json
  def create
    @itinerario = Itinerario.new(itinerario_params)

    respond_to do |format|
      if @itinerario.save
        format.html { redirect_to agency_paquete_path(@agency, @paquete), notice: 'Itinerario was successfully created.' }
        format.json { render :show, status: :created, location: @itinerario }
      else
        format.html { render :new }
        format.json { render json: @itinerario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinerarios/1
  # PATCH/PUT /itinerarios/1.json
  def update
    respond_to do |format|
      if @itinerario.update(itinerario_params)
        format.html { redirect_to @itinerario, notice: 'Itinerario was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinerario }
      else
        format.html { render :edit }
        format.json { render json: @itinerario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerarios/1
  # DELETE /itinerarios/1.json
  def destroy
    @itinerario.destroy
    respond_to do |format|
      format.html { redirect_to itinerarios_url, notice: 'Itinerario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerario
      @itinerario = Itinerario.find(params[:id])
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
    def itinerario_params
      params.fetch(:itinerario).permit(:tiempo_estadia, :descripcion)
    end
end
