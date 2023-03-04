class ColaboradorsController < ApplicationController
  before_action :set_colaborador, only: %i[ show edit update destroy ]

  # GET /colaboradors or /colaboradors.json
  def index
    @colaboradors = Colaborador.all
  end

  # GET /colaboradors/1 or /colaboradors/1.json
  def show
  end

  # GET /colaboradors/new
  def new
    @colaborador = Colaborador.new
  end

  # GET /colaboradors/1/edit
  def edit
  end

  # POST /colaboradors or /colaboradors.json
  def create
    @colaborador = Colaborador.new(colaborador_params)

    respond_to do |format|
      if @colaborador.save
        format.html { redirect_to colaborador_url(@colaborador), notice: "Colaborador was successfully created." }
        format.json { render :show, status: :created, location: @colaborador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colaboradors/1 or /colaboradors/1.json
  def update
    respond_to do |format|
      if @colaborador.update(colaborador_params)
        format.html { redirect_to colaborador_url(@colaborador), notice: "Colaborador was successfully updated." }
        format.json { render :show, status: :ok, location: @colaborador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaboradors/1 or /colaboradors/1.json
  def destroy
    @colaborador.destroy

    respond_to do |format|
      format.html { redirect_to colaboradors_url, notice: "Colaborador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colaborador
      @colaborador = Colaborador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def colaborador_params
      params.require(:colaborador).permit(:nome, :cargo, :data_contratacao)
    end
end
