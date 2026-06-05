class SourcesController < ApplicationController
  def index
    @sources = Source.all
  end

  def show
    @source = Source.find(params[:id])
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(source_params)
    if @source.save
      redirect_to sources_path, notice: "Fonte criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @source = Source.find(params[:id])
  end

  def update
    @source = Source.find(params[:id])
    if @source.update(source_params)
      redirect_to sources_path, notice: "Fonte atualizada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @source = Source.find(params[:id])
    @source.destroy
    redirect_to sources_path, notice: "Fonte deletada com sucesso!"
  end

  private

  def source_params
    params.require(:source).permit(:name)
  end
end
