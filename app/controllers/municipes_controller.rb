class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update destroy ]

  # GET /municipes or /municipes.json
  def index
    @municipes = Municipe.all.eager_load(:municipio)
    set_filters
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
    @municipe.build_endereco if @municipe.endereco.nil?

    if @municipe.save
      Municipes::Notifications::WelcomeWorker.perform_async(@municipe.id)
      redirect_to municipe_url(@municipe), notice: "Municipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /municipes/1 or /municipes/1.json
  def update
    old_status = @municipe.status
    @municipe.build_endereco if @municipe.endereco.nil?
    if @municipe.update(municipe_params)
      Municipes::Notifications::UpdateStatusWorker.perform_async(@municipe.id) if old_status != @municipe.status
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
      params.require(:municipe).permit(
        :nome_completo, :cpf, :cns, :email, :data_nascimento, :telefone, :foto, :status, :municipio_id,
        endereco_attributes: [:logradouro, :complemento, :cep, :municipio_id]
      )
    end

    def set_filters
      @municipes = @municipes.where('nome_completo ILIKE ?', "%#{params[:nome_completo]}%") if params[:nome_completo].present?
      @municipes = @municipes.where('cpf ILIKE ?', "%#{params[:cpf]}%") if params[:cpf].present?
      @municipes = @municipes.where('cns ILIKE ?', "%#{params[:cns]}%") if params[:cns].present?
      @municipes = @municipes.where('email ILIKE ?', "%#{params[:email]}%") if params[:email].present?
      @municipes = @municipes.filter_by_municipio(params[:municipio]) if params[:municipio].present?
      @municipes = @municipes.filter_by_endereco(params[:endereco]) if params[:endereco].present?
      @municipes = @municipes.paginate(page: params[:page])
    end
end
