class ArticlesController < ApplicationController
  #before_action :set_page, only: [:show, :edit, :update, :destroy]
  #before_action :set_category, only: [:show]
  before_action :set_seo
  def index
    @articles = Article.all
  end

  def show
    fail
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.title.blank?
      @article.title = @article.titre
    else
      @article.title = @article.title
    end
    @article.save
    redirect_to @article
  end

  def edit
  end

  def update
    @article.update(article_params)
    fail
    redirect_to article_path(@article.category, @article)
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :titre, :slug, :summary, :category_id)
  end

  def set_category
    #@article = Article.find(params[:id])
    #@category = article.categories.first.name.parameterize
  end

  def set_seo
    set_meta_tags noindex: true
  end

  def set_page
    #@article = Article.find_by!(slug: params[:id])
     @article = Article.find_by!(slug: params[:slug])
  end
end
