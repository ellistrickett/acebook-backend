require 'rails_helper'


RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    it "upon initialize it returns an empty JSON array " do
      get :index, params: {}
      expect(response).to be_successful
      expect(JSON.parse(response.body)).to eq([])
    end
  end

  # it "it returns a JSON list of posts" do
  #   post :create, params: {post: valid_attributes}, format: :json
  #   # Post.create valid_attributes
  #   # post_2 = Post.create valid_attributes.merge(message: "Hello 2")
  #   get :index, params: {}
  #   expect(response).to be_successful
  #   expect(JSON.parse(response.body)).to eq([
  #     {
  #       "id" => 1,
  #       "body" => "Hello!",
  #       "created_at" => "",
  #       "updated_at" => "",
  #
  #       }
  #     ])
  #   end


end
