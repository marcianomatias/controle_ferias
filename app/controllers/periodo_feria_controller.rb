class PeriodoFeriaController < ApplicationController
  before_action :set_periodo_ferium, only: %i[ show edit update destroy ]

  # GET /periodo_feria or /periodo_feria.json
  def index
    @periodo_feria = PeriodoFerium.all
  end

  # GET /periodo_feria/1 or /periodo_feria/1.json
  def show
  end

  # GET /periodo_feria/new
  def new
    @periodo_ferium = PeriodoFerium.new
  end

  # GET /periodo_feria/1/edit
  def edit
  end

  # POST /periodo_feria or /periodo_feria.json
  def create
    @periodo_ferium = PeriodoFerium.new(periodo_ferium_params)

    respond_to do |format|
      if @periodo_ferium.save
        format.html { redirect_to periodo_ferium_url(@periodo_ferium), notice: "Periodo ferium was successfully created." }
        format.json { render :show, status: :created, location: @periodo_ferium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @periodo_ferium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /periodo_feria/1 or /periodo_feria/1.json
  def update
    respond_to do |format|
      if @periodo_ferium.update(periodo_ferium_params)
        format.html { redirect_to periodo_ferium_url(@periodo_ferium), notice: "Periodo ferium was successfully updated." }
        format.json { render :show, status: :ok, location: @periodo_ferium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @periodo_ferium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodo_feria/1 or /periodo_feria/1.json
  def destroy
    @periodo_ferium.destroy

    respond_to do |format|
      format.html { redirect_to periodo_feria_url, notice: "Periodo ferium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_periodo_ferium
      @periodo_ferium = PeriodoFerium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def periodo_ferium_params
      params.require(:periodo_ferium).permit(:data_inicio, :data_fim, :colaborador_id)
    end
end
