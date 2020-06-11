module AuthorizationHelpers
  def authorize!
    
    # request.headers["Authorization"] =  "Token token=#{user.}"
  end

  def authorize_badly!
    # request.headers["Authorization"] =  "Token token=horse"
  end
end
