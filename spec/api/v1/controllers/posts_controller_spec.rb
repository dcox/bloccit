require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }

  describe "POST create" do
    before do
      @new_post = build(:post)
      post :create, post: { title: @new_post.title, body: @new_post.body, topic: my_topic, user: my_user }
    end

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