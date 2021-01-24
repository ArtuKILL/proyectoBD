class PaqueteContratosController < ApplicationController
  before_action :set_paquete_contrato, only: [:show, :edit, :update, :destroy]

  

  # GET /paquete_contratos
  # GET /paquete_contratos.json
  def index
    @paquete_contratos = PaqueteContrato.all
  end

  # GET /paquete_contratos/1
  # GET /paquete_contratos/1.json
  def show
  end

  # GET /paquete_contratos/new
  def new
    @formasDePago = {TarjetaC: "Tarjeta Credito", TarjetaD: "Tarjeta Debito", Zelle: "Zelle", Cta: "Cuenta Bancaria"}
    @paquete_contrato = PaqueteContrato.new
    
  end

  # GET /paquete_contratos/1/edit
  def edit
  end

  # POST /paquete_contratos
  # POST /paquete_contratos.json
  def create

   
   
  
    @paquete_contrato = PaqueteContrato.new(paquete_contrato_params)
    # do @paquete_contrato.create_registro_clientes()

    # @paquete_contrato.fecha_emision = Date.current

    @paquete_contrato.registro_cliente = current_cliente  #Relación de registro_cliente
    current_cliente.paquete_contratos << @paquete_contrato

    #TODO: Hacer la relación con el paquete
    respond_to do |format|
      if @paquete_contrato.save
        format.html { redirect_to @paquete_contrato, notice: 'Paquete contrato was successfully created.' }
        format.json { render :show, status: :created, location: @paquete_contrato }
      else
        format.html { render :new }
        format.json { render json: @paquete_contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paquete_contratos/1
  # PATCH/PUT /paquete_contratos/1.json
  def update
    respond_to do |format|
      if @paquete_contrato.update(paquete_contrato_params)
        format.html { redirect_to @paquete_contrato, notice: 'Paquete contrato was successfully updated.' }
        format.json { render :show, status: :ok, location: @paquete_contrato }
      else
        format.html { render :edit }
        format.json { render json: @paquete_contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paquete_contratos/1
  # DELETE /paquete_contratos/1.json
  def destroy
    @paquete_contrato.destroy
    respond_to do |format|
      format.html { redirect_to paquete_contratos_url, notice: 'Paquete contrato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paquete_contrato
      @paquete_contrato = PaqueteContrato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paquete_contrato_params
      #params.permit(:TarjetaC, :TarjetaD, :Zelle, :Cta, :numero_personas)
      params.require(:paquete_contrato).permit(:nro_presupuesto, :fecha_emision, :total_calculado, :fecha_salida, :nro_factura, :email_contacto)
    end
end
