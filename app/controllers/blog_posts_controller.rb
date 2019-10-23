class BlogPostsController < ApplicationController
  http_basic_authenticate_with name: Dotenv.parse(".env.local", ".env")["EDIT_BLOG_NAME"], password: Dotenv.parse(".env.local", ".env")["EDIT_BLOG_PASSWORD"], only: [:new, :edit]
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_seo
  layout 'blog'
  def index
    set_meta_tags canonical: "https://www.paysniederbronn.fr/blog/"
    @posts =  BlogPost.all.order(custom_date: :desc)
  end

  def show
    @author = @post.author_blog
    set_meta_tags canonical: url_for(:only_path => false)
  end

  def new
    @post = BlogPost.new
  end

  def create
    @post = BlogPost.new(blog_params)
    if @post.custom_date.blank?
      @post.custom_date = @post.created_at
    else
      @post.custom_date = @post.custom_date
    end

    if @post.title.blank?
      @post.title = @post.titre
    else
      @post.title = @post.title
    end
    author = AuthorBlog.find(params[:blog_post][:author_blog].to_i)
    author.blog_posts << @post
    @post.save
    redirect_to blog_post_path(@post)
  end

  def edit
  end

  def update
    @post.update(blog_params)
    redirect_to blog_post_path(@post)
  end

  def destroy
  end

  ### Blog categories
  def actualites
    set_meta_tags noindex: true
    @categorie = "actualites"
    @posts = BlogPost.joins(:blog_categories).where('blog_categories.name' => "Actualite").order('custom_date DESC')
    @text = ''
    @color = "pink"
  end
  def ligne_maginot
    set_meta_tags noindex: true
    @categorie = "ligne maginot"
    @posts = BlogPost.joins(:blog_categories).where('blog_categories.name' => @categorie.capitalize).order('custom_date DESC')
    @text = 'text'
    @color = "green"
  end
  def tourisme
    set_meta_tags noindex: true
    @categorie = "tourisme"
    @posts = BlogPost.joins(:blog_categories).where('blog_categories.name' => @categorie.capitalize).order('custom_date DESC')
    @text = 'text'
    @color = "green"
  end
  def thermalisme
    set_meta_tags noindex: true
    @categorie = "thermalisme"
    @posts = BlogPost.joins(:blog_categories).where('blog_categories.name' => @categorie.capitalize).order('custom_date DESC')
    @text = 'text'
    @color = "blue"
  end

  private
  def blog_params
    params.require(:blog_post).permit(:title, :description, :published, :titre, :content, :summary, :copyright, :author_blog_id, :custom_date, photos: [], blog_category_ids:[])
  end

  def set_page
    @post = BlogPost.find_by!(slug: params[:id])
  end

  def set_seo
    #set_meta_tags noindex: true
  end
end
