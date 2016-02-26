require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:post) { create(:post, user: user, topic: topic) }
  let(:comment) { create(:comment, user: user, post: post, body: "Boy, what a comment this is!") }

  context "unauthenticated user" do 
    describe "GET index" do
      it "returns http unauthenticated" do
        get :index
        expect(response).to have_http_status(401)
      end
    end

    describe "GET show" do
      it "returns http unauthenticated" do
        get :show, id: comment.id
        expect(response).to have_http_status(401)
      end
    end
  end

  context "unauthorized user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(user.auth_token)
    end

    describe "GET index" do
      before { get :index }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns data in json format" do
        expect(response.body).to eq([comment].to_json)
      end
    end

    describe "GET show" do
      before { get :show, id: comment.id }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns data in json format" do
        expect(response.body).to eq(comment.to_json)
      end
    end
  end

end