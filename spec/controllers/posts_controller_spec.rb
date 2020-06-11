require 'rails_helper'

RSpec.describe PostsController, type: :controller do

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

  end
end
