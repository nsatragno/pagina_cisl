class PonenciasController < ApplicationController
  def new
    if @ponencia == nil then
      @ponencia = Ponencia.new
    end
  end

  def create
    @ponencia = Ponencia.new(parametros)
    if @ponencia.save
      redirect_to action: :show, id: @ponencia.id
    else
      render 'new'
    end
  end

  def show
    @ponencia = Ponencia.find(params[:id])
  end

  private
    def parametros
      params.require(:ponencia).permit(:titulo, :expositor, :descripcion)
    end
end
