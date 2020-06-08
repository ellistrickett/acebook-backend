class UserController < ApplicationController

skip_before_action :authenticate_request


# curl -H "Content-Type: application/json" -X POST -d '{"user": {"email":"email","username":"username","name":"name","password":"12345","password_confirmation":"12345"}}' http://localhost:3000/signup
# example of responses:
# {"username":"username","created_at":"2020-06-07T15:56:58.721Z"}
# {"email":["has already been taken"],"username":["has already been taken"]}
# {"password":["can't be blank"]}

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
