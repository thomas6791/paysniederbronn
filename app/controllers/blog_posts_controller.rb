class BlogPostsController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
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
    author = AuthorBlog.find(params[:blog_page][:author_blog].to_i)
    author.blog_pages << @post
    @post.save
    redirect_to blog_page_path(@post)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog_post).permit(:title, :description, :published, :titre, :content, :summary, :copyright, :author_blog_id, :custom_date, photos: [], blog_category_ids:[])
  end

  def set_page
    @post = BlogPost.find_by!(slug: params[:id])
  end
end
