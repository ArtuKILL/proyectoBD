class CiudadLocalidadesController < ApplicationController
  before_action :set_ciudad_localidad, only: [:show, :edit, :update, :destroy]
  before_action :set_agency
  before_action :set_paquete

  # GET /ciudad_localidades
  # GET /ciudad_localidades.json
  def index
    @ciudad_localidades = CiudadLocalidad.all
  end

  # GET /ciudad_localidades/1
  # GET /ciudad_localidades/1.json
  def show
  end

  # GET /ciudad_localidades/new
  def new
    @ciudad_localidad = CiudadLocalidad.new
  end

  # GET /ciudad_localidades/1/edit
  def edit
  end

  # POST /ciudad_localidades
  # POST /ciudad_localidades.json
  def create
    @ciudad_localidad = CiudadLocalidad.new(ciudad_localidad_params)

    respond_to do |format|
      if @ciudad_localidad.save
        format.html { redirect_to @ciudad_localidad, notice: 'Ciudad localidad was successfully created.' }
        format.json { render :show, status: :created, location: @ciudad_localidad }
      else
        format.html { render :new }
        format.json { render json: @ciudad_localidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciudad_localidades/1
  # PATCH/PUT /ciudad_localidades/1.json
  def update
    respond_to do |format|
      if @ciudad_localidad.update(ciudad_localidad_params)
        format.html { redirect_to @ciudad_localidad, notice: 'Ciudad localidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ciudad_localidad }
      else
        format.html { render :edit }
        format.json { render json: @ciudad_localidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudad_localidades/1
  # DELETE /ciudad_localidades/1.json
  def destroy
    @ciudad_localidad.destroy
    respond_to do |format|
      format.html { redirect_to ciudad_localidades_url, notice: 'Ciudad localidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciudad_localidad
      @ciudad_localidad = CiudadLocalidad.find(params[:id])
    end

    def set_paquete
      @paquete = Paquete.find(params[:paquete_id])
    end
    
    def set_agency
      @agency = Agency.find(params[:agency_id])
    end


    # Only allow a list of trusted parameters through.
    def ciudad_localidad_params
      params.fetch(:ciudad_localidad).require(:nombre_ciudad)
    end
end
