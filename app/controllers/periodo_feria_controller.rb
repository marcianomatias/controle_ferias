class PeriodoFeriaController < ApplicationController
  before_action :set_periodo_ferium, only: %i[ show edit update destroy ]

  # GET /periodo_feria or /periodo_feria.json
  def index
    @periodos_de_ferias = PeriodoFerias.all
  end

  # GET /periodo_feria/1 or /periodo_feria/1.json
  def show
  end

  # GET /periodo_feria/new
  def new
    @periodos_de_ferias = PeriodoFerias.new
  end

  # GET /periodo_feria/1/edit
  def edit
  end

  # POST /periodo_feria or /periodo_feria.json
  def create
    @periodos_de_ferias= PeriodoFerias.new(periodo_ferias_params)

    respond_to do |format|
      if @periodo_ferias.save
        format.html { redirect_to periodo_ferium_url(@periodo_ferias), notice: "Periodo ferium was successfully created." }
        format.json { render :show, status: :created, location: @periodo_ferium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @periodo_ferias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /periodo_feria/1 or /periodo_feria/1.json
  def update
    respond_to do |format|
      if @periodo_ferias.update(periodo_ferium_params)
        format.html { redirect_to periodo_ferium_url(@periodo_ferias), notice: "Periodo ferium was successfully updated." }
        format.json { render :show, status: :ok, location: @periodo_ferias }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @periodo_ferias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodo_feria/1 or /periodo_feria/1.json
  def destroy
    @periodo_ferias.destroy

    respond_to do |format|
      format.html { redirect_to periodo_feria_url, notice: "Periodo ferias was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_periodo_ferias
      @periodo_ferias = PeriodoFerias.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def periodo_ferias_params
      params.require(:periodo_ferias).permit(:data_inicio, :data_fim, :colaborador_id)
    end
end
