class MunicipiosController < ApplicationController
  before_action :set_municipio, only: %i[ show edit update destroy ]

  # GET /municipios or /municipios.json
  def index
    @municipios = Municipio.all.eager_load(:estado).paginate(page: params[:page])
  end

  # GET /municipios/1 or /municipios/1.json
  def show
  end

  # GET /municipios/new
  def new
    @municipio = Municipio.new
  end

  # GET /municipios/1/edit
  def edit
  end

  # POST /municipios or /municipios.json
  def create
    @municipio = Municipio.new(municipio_params)
    if @municipio.save
      redirect_to municipio_url(@municipio), notice: "Municipio was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /municipios/1 or /municipios/1.json
  def update
    if @municipio.update(municipio_params)
      redirect_to municipio_url(@municipio), notice: "Municipio was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /municipios/1 or /municipios/1.json
  def destroy
    @municipio.destroy
    redirect_to municipios_url, notice: "Municipio was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipio
      @municipio = Municipio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def municipio_params
      params.require(:municipio).permit(:nome, :estado_id)
    end
end
