require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let(:user_attributes) {
    { email: "will@makers.com", username: "w1ll", name: "Will", password: "12345", password_confirmation: "12345" }
  }

  # let(:user) {  }

  describe "User #authenticate" do

    it 'logs in a valid user' do
      old_controller = @controller
      @controller = UserController.new
      post :create, params: { user: user_attributes }, format: :json
      @controller = old_controller

      post :authenticate, params: { username: "w1ll", password: "12345" }
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json')
    end

    it 'deny an invalid user' do
      old_controller = @controller
      @controller = UserController.new
      post :create, params: { user: user_attributes }, format: :json
      @controller = old_controller

      post :authenticate, params: { email: "none@makers.com", password: "12345" }
      expect(response).to have_http_status(:unauthorized)
      expect(response.content_type).to eq('application/json')
    end

    it 'deny wrong password' do
      old_controller = @controller
      @controller = UserController.new
      post :create, params: { user: user_attributes }, format: :json
      @controller = old_controller

      post :authenticate, params: { email: "will@makers.com", password: "123456" }
      expect(response).to have_http_status(:unauthorized)
      expect(response.content_type).to eq('application/json')
    end
  end

end
