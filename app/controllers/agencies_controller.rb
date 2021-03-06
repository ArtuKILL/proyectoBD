class AgenciesController < ApplicationController
  before_action :set_agency, only: [:show, :edit, :update, :destroy]

  # GET /agencies
  # GET /agencies.json
  def index
    @agencies = Agency.all
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
    @socio = Socio.all
  end

  # GET /agencies/new
  def new
    @agency = Agency.new(agency_params)
  end

  # GET /agencies/1/edit
  def edit
  end


  # POST /agencies
  # POST /agencies.json
  def create
  
    @agency = Agency.new(agency_params)

    respond_to do |format|
      if @agency.save
        format.html { redirect_to agencies_path(@agency), notice: 'Agency was successfully created.' }
        format.json { render :show, status: :created, location: @agency }
      else
        format.html { render :new }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    respond_to do |format|
      if @agency.update(agency_params)
        format.html { redirect_to @agency, notice: 'Agency was successfully updated.' }
        format.json { render :show, status: :ok, location: @agency }
      else
        format.html { render :edit }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @agency.destroy
    respond_to do |format|
      format.html { redirect_to agencies_url, notice: 'Agency was successfully destroyed.' }
      
    end
  end

  def crear_registro_cliente
    registro = RegistroCliente.new(fecha_registro: Date.current) 
    @agency = Agency.find(params[:format])
    registro.agency = @agency
    registro.cliente = current_cliente
    current_cliente.registro_clientes.append(registro)
    @agency.registro_clientes.append(registro)
    if registro.save
      redirect_to @agency, notice: "Te has registrado en #{@agency.nombre_agencia}"
    else
      redirect_to @agency, alert: "Ha ocurrido un error al registrarte en #{@agency.nombre_agencia}"
     end
  end

  def cerrar_sociedad
    socio = Socio.find(params[:format])
  
    if socio.update_attribute(:fecha_final, Time.now)
      flash[:notice] = "Sociedad cerrada"
      redirect_to request.referer
    else
      redirect_to @agency, alert: "Ha ocurrido un error al registrarte en #{@agency.nombre_agencia}"
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency
      @agency = Agency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agency_params
      params.fetch(:agency, {}).permit(:id,:nombre_agencia, :url, :alcance, :tipo, :descripcion)
    end
  
end
 
