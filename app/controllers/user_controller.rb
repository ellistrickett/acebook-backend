class UserController < ApplicationController

skip_before_action :authenticate_request

  def new

  end


  def index

  end

  def create
    @user = User.new(user_params)
    respond_to do |format|

      if @user.save
        format.json { render json: @user, only: [:username, :created_at] }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end

    end

  end

  private

  def user_params
     params.require(:user).permit(:email, :username, :name, :password, :password_confirmation)
  end

end
