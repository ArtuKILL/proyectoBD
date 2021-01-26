class DetalleServiciosController < ApplicationController
  before_action :set_detalle_servicio, only: [:show, :edit, :update, :destroy]
  before_action :set_paquete
  before_action :set_agency

  # GET /detalle_servicios
  # GET /detalle_servicios.json
  def index
    @detalle_servicios = DetalleServicio.all
  end

  # GET /detalle_servicios/1
  # GET /detalle_servicios/1.json
  def show
  end

  # GET /detalle_servicios/new
  def new
    @detalle_servicio = DetalleServicio.new
    @servicio_hotel = @detalle_servicio.servicio_hoteles.build
    @alojamiento_hotel = @servicio_hotel.build_alojamiento_hotel
  end

  # GET /detalle_servicios/1/edit
  def edit
  end

  # POST /detalle_servicios
  # POST /detalle_servicios.json
  def create
    @detalle_servicio = DetalleServicio.new(detalle_servicio_params)
    @detalle_servicio.id_paquete = @paquete.id
    @servicio_hotel = @detalle_servicio.servicio_hoteles.build
    @alojamiento_hotel = @servicio_hotel.build_alojamiento_hotel
 
    @servicio_hotel.id_servicio = @detalle_servicio.id_servicio
    @servicio_hotel.id_hotel = @detalle_servicio.servicio_hoteles.id_hotel


    respond_to do |format|
      if @detalle_servicio.save
        format.html { redirect_to agency_paquete_path(@agency, @paquete) , notice: 'Detalle servicio was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_servicio }
      else
        format.html { render :new }
        format.json { render json: @detalle_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_servicios/1
  # PATCH/PUT /detalle_servicios/1.json
  def update
    respond_to do |format|
      if @detalle_servicio.update(detalle_servicio_params)
        format.html { redirect_to agency_paquete_path(@agency, @paquete), notice: 'Detalle servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_servicio }
      else
        format.html { render :edit }
        format.json { render json: @detalle_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_servicios/1
  # DELETE /detalle_servicios/1.json
  def destroy
    @detalle_servicio.destroy
    respond_to do |format|
      format.html { redirect_to agency_paquete_path(@agency, @paquete), notice: 'Detalle servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_servicio
      @detalle_servicio = DetalleServicio.find(params[:id])
    end

    def set_paquete
      @paquete = Paquete.find(params[:paquete_id])
    end
    
    def set_agency
      @agency = Agency.find(params[:agency_id])
    end

    # Only allow a list of trusted parameters through.
    def detalle_servicio_params
      params.require(:detalle_servicio).permit(:tipo, :descripcion, :comida, servicio_hoteles_attributes: [:id_servicio, :id_hotel, alojamiento_hoteles_attributes: [:id_hotel, :nombre_hotel]])
    end
end
