class BlogPostsController < ApplicationController
  http_basic_authenticate_with name: "hunckler", password: "gabriel-6791", only: [:new, :edit]
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_seo
  layout 'blog', except: [:new, :edit]

  add_breadcrumb "Blog", :blog_posts_path
  def index
    set_meta_tags canonical: "https://www.paysniederbronn.fr/blog/"
    @posts =  BlogPost.all.where(published: true).order(custom_date: :desc)
  end

  def show
    add_breadcrumb "#{@url[:action].sub("_"," ").downcase}", "/blog/#{@url[:action].sub("_","-")}" if ["home","index","show","edit","update"].exclude?(@url[:action])
    add_breadcrumb "#{@post.titre}", blog_post_path, title: "retour"
    @author = @post.author_blog
    if !@post.link_left.blank? && !@post.link_right.blank?
      @left = BlogPost.find_by_slug(@post.link_left.scan(/blog\/.+/)[0].gsub(/blog\//, '')) != nil ? BlogPost.find_by_slug(@post.link_left.scan(/blog\/.+/)[0].gsub(/blog\//, '')).titre : "Lire un autre article"
      @right = BlogPost.find_by_slug(@post.link_right.scan(/blog\/.+/)[0].gsub(/blog\//, '')) != nil ? BlogPost.find_by_slug(@post.link_right.scan(/blog\/.+/)[0].gsub(/blog\//, '')).titre : "Lire un autre article"
    end
    if @post.canonical.blank?
      set_meta_tags canonical: url_for(:only_path => false)
    else
      set_meta_tags canonical: @post.canonical
    end
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
    add_breadcrumb "actualites", actualites_blog_posts_path, title: "actualites"
    set_meta_tags noindex: true
    @categorie = "actualites"
    @posts = BlogPost.joins(:blog_categories).where('blog_categories.name' => "Actualite").order('custom_date DESC')
    @text = ''
    @color = "pink"
  end
  def ligne_maginot
    add_breadcrumb "ligne maginot", ligne_maginot_blog_posts_path, title: "actualites"
    set_meta_tags noindex: true
    @categorie = "ligne maginot"
    @posts = BlogPost.joins(:blog_categories).where('blog_categories.name' => @categorie.capitalize).order('custom_date DESC')
    @text = ''
    @color = "beige"
  end
  def tourisme
    add_breadcrumb "tourisme", tourisme_blog_posts_path, title: "actualites"
    set_meta_tags noindex: true
    @categorie = "tourisme"
    @posts = BlogPost.joins(:blog_categories).where('blog_categories.name' => @categorie.capitalize).order('custom_date DESC')
    @text = ''
    @color = "green"
  end
  def thermalisme
    add_breadcrumb "thermalisme", thermalisme_blog_posts_path, title: "actualites"
    set_meta_tags noindex: true
    @categorie = "thermalisme"
    @posts = BlogPost.joins(:blog_categories).where('blog_categories.name' => @categorie.capitalize).order('custom_date DESC')
    @text = "Les dernières actualités dans le <a href='https://www.paysniederbronn.fr/blog/qu-est-ce-que-le-thermalisme' >thermalisme</a>, dans les bienfaits de l'utilisation des eaux thermales mais également dans l'activité des différentes stations thermales en France"
    @color = "blue"
  end

  private
  def blog_params
    params.require(:blog_post).permit(:title, :description, :published, :titre, :content, :summary, :copyright, :canonical, :link_left, :link_right, :author_blog_id, :custom_date, photos: [], blog_category_ids:[])
  end

  def set_page
    @post = BlogPost.find_by!(slug: params[:id])
    @url = Rails.application.routes.recognize_path(request.referrer)
  end

  def set_seo
    #set_meta_tags noindex: true
  end
end
