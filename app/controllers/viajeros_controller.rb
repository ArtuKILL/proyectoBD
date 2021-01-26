class ViajerosController < ApplicationController
  before_action :set_viajero, only: [:show, :edit, :update, :destroy]

  # GET /viajeros
  # GET /viajeros.json
  def index
    @viajeros = Viajero.all
    @agencies= @viajero.agencies.all
  end

  # GET /viajeros/1
  # GET /viajeros/1.json
  def show
  end

  # GET /viajeros/new
  def new
    @viajero = Viajero.new
  end

  # GET /viajeros/1/edit
  def edit
  end

  # POST /viajeros
  # POST /viajeros.json
  def create
    dia = params[:date][:day]
    mes = params[:date][:month]
    año = params[:date][:year]
    @viajero = Viajero.new(viajero_params)
    @viajero.fecha_nacimiento = Date.parse("#{dia}/#{mes}/#{año}")
    respond_to do |format|
      if @viajero.save
        format.html { redirect_to @viajero, notice: 'Viajero was successfully created.' }
        format.json { render :show, status: :created, location: @viajero }
      else
        format.html { render :new }
        format.json { render json: @viajero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viajeros/1
  # PATCH/PUT /viajeros/1.json
  def update
    respond_to do |format|
      if @viajero.update(viajero_params)
        format.html { redirect_to @viajero, notice: 'Viajero was successfully updated.' }
        format.json { render :show, status: :ok, location: @viajero }
      else
        format.html { render :edit }
        format.json { render json: @viajero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viajeros/1
  # DELETE /viajeros/1.json
  def destroy
    @viajero.destroy
    respond_to do |format|
      format.html { redirect_to viajeros_url, notice: 'Viajero was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viajero
      @viajero = Viajero.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def viajero_params
      params.require(:viajero).permit(:id_viajero, :primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :genero, :fecha_nacimiento, :correo_viajero)
    end
end
