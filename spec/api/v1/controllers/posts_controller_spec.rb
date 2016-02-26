require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }

  describe "POST create" do
    before {post :create, post: { title: "A New Post", body: "This is a great post to talk about.", topic: my_topic } }


    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns content in json format" do
    end

    it "creates a post with the correct attributes" do 
    end

  end

  describe "PUT update" do

    it "returns http success" do
    end

    it "returns content in json format" do
    end

    it "updates the post with the correct attributes" do 
    end

  end

  describe "DELETE destroy" do

    it "returns http success" do 
    end

    it "returns the correct json confirmation message" do 
    end

    it "deletes the post" do
    end
  end

end