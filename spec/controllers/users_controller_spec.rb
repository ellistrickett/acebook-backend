require 'rails_helper'

RSpec.describe UserController, type: :controller do

  let(:valid_attributes) {
    { email: "will@makers.com", username: "w1ll", name: "Will", password: "12345", password_confirmation: "12345" }
  }

  let(:invalid_attributes) {
    { email: nil, username: "w1ll", name: "Will", password: "12345", password_confirmation: "12345" }
  }

  describe "User #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: { user: valid_attributes }, format: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post :create, params: { user: valid_attributes }, format: :json
        expect(response).to have_http_status(:success)
        expect(response.content_type).to eq('application/json')
        user = User.last
        expect(JSON.parse(response.body)).to include({
          # "created_at" => user.created_at,
          "username" => user.username
        })
      end
    end
  end

  context "with invalid params" do
    it "renders a JSON response with errors for the new user" do
      post :create, params: { user: invalid_attributes }, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to eq('application/json')
    end
  end

  context "with a duplicate username/email" do
    it "renders a JSON response with errors for the new user" do
      post :create, params: { user: valid_attributes }, format: :json
      post :create, params: { user: valid_attributes }, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to eq('application/json')
    end
  end
end
