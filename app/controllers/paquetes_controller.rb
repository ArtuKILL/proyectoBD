class PaquetesController < ApplicationController
  before_action :set_paquete, only: [:show, :edit, :update, :destroy], except: [:index]
  before_action :set_agency, except: [:index]

  # GET /paquetes
  # GET /paquetes.json
  def index
    @paquetes = Paquete.all
    @agencies = Agency.all

    @paquete = Paquete.find_by(params[:id_agencia])
  end

  # GET /paquetes/1
  # GET /paquetes/1.json
  def show
    
  end

  # GET /paquetes/new
  def new
    @paquete = @agency.paquetes.new
  end
  

  # GET /paquetes/1/edit
  def edit
    @calendario_anual = CalendarioAnual.new

    @calendario_anuales = CalendarioAnual.all
    @hist_precio = HistPrecio.all
    @area_interes = AreaInteres.all
  end

  # POST /paquetes
  # POST /paquetes.json
  def create
    @paquete = Paquete.new(paquete_params)
    @paquete.id_agencia = @agency.id
 
      respond_to do |format|
          if @paquete.save
            format.html { redirect_to agency_paquete_path(@agency, @paquete), notice: 'Paquete was successfully created.' }
            format.json { render :show, status: :created, location: @paquete }
          else
            format.html { render :new }
            format.json { render json: @paquete.errors, status: :unprocessable_entity }
          end
      end
  end

  # PATCH/PUT /paquetes/1
  # PATCH/PUT /paquetes/1.json
  def update
    respond_to do |format|
      if @paquete.update(paquete_params)
        format.html { redirect_to  agency_paquete_path(@agency), notice: 'Paquete was successfully updated.' }
        format.json { render :show, status: :ok, location: @paquete }
      else
        format.html { render :edit }
        format.json { render json: @paquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paquetes/1
  # DELETE /paquetes/1.json
  def destroy
    @paquete.destroy
    respond_to do |format|
      format.html { redirect_to paquetes_index_path, notice: 'Paquete was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paquete
      @paquete = Paquete.find(params[:id])
    end

    def set_agency
      @agency = Agency.find(params[:agency_id])
    end

    # Only allow a list of trusted parameters through.
    def paquete_params
      params.fetch(:paquete).permit(:nombre_paquete, :descripcion, :duracion_dias, :cant_personas, :id_agencia)
    end
end
