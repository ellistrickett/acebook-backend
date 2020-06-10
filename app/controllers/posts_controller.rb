class PostsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    respond_to do |format|
      if @post.save
        format.json { render json: @post, only: [:username, :created_at]  }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def index
    @posts = Post.all
    render json: @posts
  end


  def update
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      respond_to do |format|
        if @post.update(update_params)
          format.json { render json: @post }
        else
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      render json: :unathorized
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
      render json: :unathorized
    end
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

  def update_params
      params.require(:post).permit(:message)
  end

end

# eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE4ODUyMzd9.po8TIc24gS5HL0iydycZxvn-fbWtOjg2QrT-gcdIJLQ

# curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE4ODk3ODV9.PU6M0t13XzgI23q5Go5yDc4x1FKU2CoQ4zU0TNUyTYo" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"post":{"message":"hello,world!"}}' http://localhost:3000/new
#
# curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE4ODUzOTB9.208HifaTNHK2xJOtKWyjDE5z7drtiGa9puU-SWuOd_I" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"post":{"message":"hello,world!"}}' http://localhost:3000/new
#
# curl -H "Content-Type: application/json" -X POST -d '{"email":"email","password":"12345"}' http://localhost:3000/login
