require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    it "upon initialization it returns an empty JSON array " do
      get :index, params: {}
      expect(response).to be_successful
      expect(JSON.parse(response.body)).to eq([])
    end


    # it "it creates a new post" do
    #   expect {
    #       post :create, params: {post: {message:"hello, world!"}}, format: :json
    #   }.to change(Post, :count).by(1)
    # end

  end
end
