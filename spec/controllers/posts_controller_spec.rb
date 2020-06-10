# require 'rails_helper'
#
#
# RSpec.describe PostsController, type: :controller do
#
#   let(:valid_attributes) {
#     { user_id: 1, message: "Hello!" }
#   }
#
#   let(:post_attributes) {
#     { email:"will@makers.com", username: "w1ll", name: "Will", password: "12345" ,password_confirmation: "12345"}
#   }
#
#   describe "GET #index" do
#       it "returns a JSON list of posts" do
#         post :create, params: {user: post_attributes}, format: :json
#         post = Post.create valid_attributes
#         post_2 = Post.create valid_attributes.merge(message: "Hello 2")
#         get :index, params: {}
#         expect(response).to be_successful
#         expect(JSON.parse(response.body)).to eq([
#           {
#             "id" => post_2.id,
#             "body" => post_2.message,
#             "created_at" => post_2.created_at.as_json,
#             "updated_at" => post_2.updated_at.as_json,
#             "user" => {
#               "id" => post_2.user.id,
#               "handle" => post_2.user.name
#             },
#
#           },
#           {
#             "id" => post.id,
#             "body" => post.message,
#             "created_at" => post.created_at.as_json,
#             "updated_at" => post.updated_at.as_json,
#             "user" => {
#               "id" => post.user.id,
#               "handle" => post.user.handle
#             },
#
#           }
#         ])
#       end
#     end
#
#
# #
# #
# #
# #
# #   describe "POST /new not logged in" do
# #     it "responds with 401" do
# #       post :new
# #       expect(response).to have_http_status(401)
# #     end
# #   end
# #
# #   describe "POST /" do
# #     it "responds with posts array" do
# #       post :create, params: { post: { user_id: 1, message: "Hello, world!" } }
# #       expect(JSON.parse(response.body)).to eq([ { "id" => post.id,
# #           "message" => post.message, 
# #                                               "created_at" => post.created_at.as_json, 
# #                                               "updated_at" => post.updated_at.as_json, 
# #                                               "user" => {  handle" => post.username  }])
# #     end
# #   end
# #
# #
# #     it "creates a post" do
# #       post :create, params: { post: { message: "Hello, world!" } }
# #       expect(Post.find_by(message: "Hello, world!")).to be
# #     end
# #   end
# #
# #   describe "GET /" do
# #     it "responds with 200" do
# #       get :index
# #       expect(response).to have_http_status(200)
# #     end
# #   end
# end
