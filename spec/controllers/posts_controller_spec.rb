require 'rails_helper'
require 'json_helper'

RSpec.describe PostsController, type: :controller do
  # describe "POST /new not logged in" do
  #   it "responds with 401" do
  #     post :new
  #     expect(response).to have_http_status(401)
  #   end
  # end
# 
#   describe "POST /" do
#     it "responds with posts array" do
#       post :create, params: { post: { user_id: 1, message: "Hello, world!" } }
#       expect(JSON.parse(response.body)).to eq([ { "id" => post.id,
#           "message" => post.message, 
#                                               "created_at" => post.created_at.as_json, 
#                                               "updated_at" => post.updated_at.as_json, 
#                                               "user" => {  handle" => post.username  }])
#     end
#   end
#

  #   it "creates a post" do
  #     post :create, params: { post: { message: "Hello, world!" } }
  #     expect(Post.find_by(message: "Hello, world!")).to be
  #   end
  # end

  # describe "GET /" do
  #   it "responds with 200" do
  #     get :index
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
