class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    @post = Post.create(post_params)
    @post.likes = 0
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def like
    @post = Post.find(params[:id])
    if @post.likes
      @post.likes += 1
      @post.save
    end
    redirect_to post_path(@post)
  end

end