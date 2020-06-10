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
   respond_to do |format|
     if @post.update(user_params)
       format.json { render json: @post }
     else
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end
 end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

end
