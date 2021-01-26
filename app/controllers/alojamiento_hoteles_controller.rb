class AlojamientoHotelesController < ApplicationController
  before_action :set_alojamiento_hotel, only: [:show, :edit, :update, :destroy]
  before_action :set_detalle_servicio
  before_action :set_agency
  before_action :set_paquete

  # GET /alojamiento_hoteles
  # GET /alojamiento_hoteles.json
  def index
    @alojamiento_hoteles = AlojamientoHotel.all
  end

  # GET /alojamiento_hoteles/1
  # GET /alojamiento_hoteles/1.json
  def show
  end

  # GET /alojamiento_hoteles/new
  def new
    @alojamiento_hotel = AlojamientoHotel.new
  end

  # GET /alojamiento_hoteles/1/edit
  def edit
  end

  # POST /alojamiento_hoteles
  # POST /alojamiento_hoteles.json
  def create
    @alojamiento_hotel = AlojamientoHotel.new(alojamiento_hotel_params)

    respond_to do |format|
      if @alojamiento_hotel.save
        format.html { redirect_to @alojamiento_hotel, notice: 'Alojamiento hotel was successfully created.' }
        format.json { render :show, status: :created, location: @alojamiento_hotel }
      else
        format.html { render :new }
        format.json { render json: @alojamiento_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alojamiento_hoteles/1
  # PATCH/PUT /alojamiento_hoteles/1.json
  def update
    respond_to do |format|
      if @alojamiento_hotel.update(alojamiento_hotel_params)
        format.html { redirect_to @alojamiento_hotel, notice: 'Alojamiento hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @alojamiento_hotel }
      else
        format.html { render :edit }
        format.json { render json: @alojamiento_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alojamiento_hoteles/1
  # DELETE /alojamiento_hoteles/1.json
  def destroy
    @alojamiento_hotel.destroy
    respond_to do |format|
      format.html { redirect_to alojamiento_hoteles_url, notice: 'Alojamiento hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alojamiento_hotel
      @alojamiento_hotel = AlojamientoHotel.find(params[:id])
    end

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
    def alojamiento_hotel_params
      params.fetch(:alojamiento_hotel, {})
    end
end
