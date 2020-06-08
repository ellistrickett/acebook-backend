class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 # curl -H "Content-Type: application/json" -X POST -d '{"email":"example@mail.com","password":"123123123"}' http://localhost:3000/authenticate
 # responses include:
 # {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1OTE2MzEyMjF9.pUlCsEamJgr_HxQl-yFXO_PCjbQcxB1-1xVagWQBoXk"}
 # {"error":{"user_authentication":"invalid credentials"}}

 def authenticate
   command = AuthenticateUser.call(params[:email], params[:password])

   if command.success?
     render json: { auth_token: command.result }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end
end
