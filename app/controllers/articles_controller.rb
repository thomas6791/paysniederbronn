class ArticlesController < ApplicationController
  before_action :set_category, only: [:show]
  def index
    @articles = Article.all
  end

  def show
    #@article = Article.find(params[:id])
    @article = Article.find_by(title: params[:title])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    redirect_to @article
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, category_ids:[])
  end

  def set_category
    #@article = Article.find(params[:id])
    #@category = article.categories.first.name.parameterize
  end
end
