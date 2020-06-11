require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include AuthorizationHelpers
  let(:user_attributes) {
    { email: "will@makers.com", username: "w1ll", name: "Will", password: "12345", password_confirmation: "12345" }
  }

  let(:user) { post :create, params: { user: user_attributes }, format: :json }

  describe "GET #index" do
    it "upon initialization it returns an empty JSON array " do
      get :index, params: {}
      expect(response).to be_successful
      expect(JSON.parse(response.body)).to eq([])
    end

    # it "it creates a new post" do

    #   old_controller = @controller 
    #   @controller = UserController.new
    #   post :create, params: {user: user_attributes}, format: :json
      
    #   @controller = AuthenticationController.new
    #   repsonse = post :authenticate, params: {email:"will@makers.com", password: "12345"}, format: :json

    #   p response

    #   # @_response_body=["{\"auth_token\":\"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMjMsImV4cCI6MTU5MTk3MTg4Mn0.JVLV7sm-1maaPa24TCTvNC10g-bAoTp4DN9-KPrvRXo\"}"]
    #   @controller = old_controller

    #   # authorize!
    #   expect {
    #       post :create, params: {post: {message:"hello, world!"}}.merge(user_id: 1), format: :json
    #   }.to change(Post, :count).by(1)
    # end

  end
end
