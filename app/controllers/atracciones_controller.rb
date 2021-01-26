class AtraccionesController < ApplicationController
  before_action :set_atraccion, only: [:show, :edit, :update, :destroy]
  before_action :set_agency
  before_action :set_paquete

  # GET /atracciones
  # GET /atracciones.json
  def index
    @atracciones = Atraccion.all
  end

  # GET /atracciones/1
  # GET /atracciones/1.json
  def show
  end

  # GET /atracciones/new
  def new
    @atraccion = Atraccion.new
  end

  # GET /atracciones/1/edit
  def edit
  end

  # POST /atracciones
  # POST /atracciones.json
  def create
    @atraccion = Atraccion.new(atraccion_params)

    respond_to do |format|
      if @atraccion.save
        format.html { redirect_to agency_paquete_path(@agency, @paquete), notice: 'Atraccion was successfully created.' }
        format.json { render :show, status: :created, location: @atraccion }
      else
        format.html { render :new }
        format.json { render json: @atraccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atracciones/1
  # PATCH/PUT /atracciones/1.json
  def update
    respond_to do |format|
      if @atraccion.update(atraccion_params)
        format.html { redirect_to @atraccion, notice: 'Atraccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @atraccion }
      else
        format.html { render :edit }
        format.json { render json: @atraccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atracciones/1
  # DELETE /atracciones/1.json
  def destroy
    @atraccion.destroy
    respond_to do |format|
      format.html { redirect_to atracciones_url, notice: 'Atraccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atraccion
      @atraccion = Atraccion.find(params[:id])
    end

    def set_paquete
      @paquete = Paquete.find(params[:paquete_id])
    end
    
    def set_agency
      @agency = Agency.find(params[:agency_id])
    end

    # Only allow a list of trusted parameters through.
    def atraccion_params
      params.fetch(:atraccion).permit(:nombre_atraccion, :descripcion_atraccion)
    end
end
