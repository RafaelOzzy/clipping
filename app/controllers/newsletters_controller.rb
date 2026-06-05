class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.all
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save
      redirect_to newsletters_path, notice: "Clipping criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.update(newsletter_params)
      redirect_to newsletters_path, notice: "Clipping atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    redirect_to newsletters_path, notice: "Clipping deletado com sucesso!"
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:title, :sent_at, :sent, article_ids: [])
  end
end
