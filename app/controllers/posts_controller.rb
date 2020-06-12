class PostsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    respond_to do |format|
      if @post.save
        format.json { render json: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @posts = Post.all
    render json: @posts
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      update_helper()
    else
      render json: :unauthorized
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      respond_to do |format|
        @post.destroy
        format.json { render json: :deleted }
      end
    else
      render json: :unauthorized
    end
  end

  private

  def update_params
    params.require(:post).permit(:message)
  end

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

  def update_helper
    respond_to do |format|
      if @post.update(update_params)
        format.json { render json: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

end
