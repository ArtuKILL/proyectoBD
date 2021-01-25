class CalendarioAnualesController < ApplicationController
  before_action :set_calendario_anual, only: [:show, :edit, :update, :destroy]
  before_action :set_paquete
  before_action :set_agency

  # GET /calendario_anuales
  # GET /calendario_anuales.json
  def index
    @calendario_anuales = CalendarioAnual.all
  end

  # GET /calendario_anuales/1
  # GET /calendario_anuales/1.json
  def show
  end

  # GET /calendario_anuales/new
  def new
    @calendario_anual = CalendarioAnual.new
  end

  # GET /calendario_anuales/1/edit
  def edit
  end

  # POST /calendario_anuales
  # POST /calendario_anuales.json
  def create
    @calendario_anual = CalendarioAnual.new(calendario_anual_params)
    @calendario_anual.id_paquete = @paquete.id

    respond_to do |format|
      if @calendario_anual.save
        format.html { redirect_to agency_paquete_path(@agency, @paquete), notice: 'Calendario anual was successfully created.' }
        format.json { render :show, status: :created, location: @calendario_anual }
      else
        format.html { render :new }
        format.json { render json: @calendario_anual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendario_anuales/1
  # PATCH/PUT /calendario_anuales/1.json
  def update
    respond_to do |format|
      if @calendario_anual.update(calendario_anual_params)
        format.html { redirect_to @calendario_anual, notice: 'Calendario anual was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendario_anual }
      else
        format.html { render :edit }
        format.json { render json: @calendario_anual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendario_anuales/1
  # DELETE /calendario_anuales/1.json
  def destroy
    @calendario_anual.destroy
    respond_to do |format|
      format.html { redirect_to agency_paquete_path(@agency, @paquete), notice: 'Calendario anual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendario_anual
      @calendario_anual = CalendarioAnual.find(params[:id])
    end

    def set_paquete
      @paquete = Paquete.find(params[:paquete_id])
    end
    
    def set_agency
      @agency = Agency.find(params[:agency_id])
    end

    # Only allow a list of trusted parameters through.
    def calendario_anual_params
      params.fetch(:calendario_anual).permit(:fecha_salida, :descripcion)
    end
end
