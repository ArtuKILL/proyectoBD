class PaqueteContratosController < ApplicationController
  before_action :set_paquete_contrato, only: [:show, :edit, :update, :destroy]

    FORMAS = {TarjetaC: "Tarjeta Credito", TarjetaD: "Tarjeta Debito", Zelle: "Zelle", Cta: "Cuenta Bancaria"}

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
    @formasDePago = FORMAS
    @paquete_contrato = PaqueteContrato.new
    @idAgencia = params[:agency_id]
    @idPaquete = params[:paquete_id]
  end

  # GET /paquete_contratos/1/edit
  def edit
  end

  # POST /paquete_contratos
  # POST /paquete_contratos.json
  def create
    @idAgencia = params[:agencia_id]
    @idPaquete = params[:paquete_id]

    @formasDePago = FORMAS
    
    agency = Agency.find(params[:agencia_id])
    @paquete_contrato = PaqueteContrato.new(paquete_contrato_params)

    



    respond_to do |format|
      if @paquete_contrato.save
        format.html { redirect_to @paquete_contrato, notice: 'Paquete contrato was successfully created.' }
        format.json { render :show, status: :created, location: @paquete_contrato }
        if cliente_signed_in?
          unless current_cliente.agencies.include?(agency)
            logger.debug "Cliente no tiene registro con #{agency.nombre_agencia}"
            registro = RegistroCliente.new(fecha_registro: Date.today)
            registro.cliente = current_cliente
            registro.agency = agency

            if registro.save
             agency.registro_clientes << registro
             current_cliente.registro_clientes << registro 
            end

          else
            logger.debug "Cliente tiene registro con #{agency.nombre_agencia}"
          end
        end
      else
        format.html { render :new, paquete_id: @idPaquete, agency_id: @idAgencia }
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
