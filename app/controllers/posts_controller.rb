class PostsController < ApplicationController

skip_before_action :authenticate_request, only: [:index]


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.json { render :show, status: :created, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @posts = Post.all
    render json: @posts, only: [:id, :message]
  end

  private

  def post_params
    params.permit(:message)
  end
end
