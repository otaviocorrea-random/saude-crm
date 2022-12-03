class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update destroy ]

  # GET /municipes or /municipes.json
  def index
    @municipes = Municipe.all
  end

  # GET /municipes/1 or /municipes/1.json
  def show
  end

  # GET /municipes/new
  def new
    @municipe = Municipe.new
  end

  # GET /municipes/1/edit
  def edit
  end

  # POST /municipes or /municipes.json
  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      redirect_to municipe_url(@municipe), notice: "Municipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /municipes/1 or /municipes/1.json
  def update
    if @municipe.update(municipe_params)
      redirect_to municipe_url(@municipe), notice: "Municipe was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /municipes/1 or /municipes/1.json
  def destroy
    @municipe.destroy
    redirect_to municipes_url, notice: "Municipe was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipe
      @municipe = Municipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def municipe_params
      params.require(:municipe).permit(:nome_completo, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status)
    end
end
