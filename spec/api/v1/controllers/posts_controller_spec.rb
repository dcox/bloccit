require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do 
  let(:my_user) { create(:user) }
  let(:post) { create(:post) }

  context "unauthenticated user" do

    describe "GET index" do

      before { get :index }

      it "returns http unauthenticated" do 
        expect(response).to have_http_status(401)
      end

    end

    describe "GET show" do 

      before { get :show, id: post.id } 

      it "returns http unauthenticated" do
        expect(response).to have_http_status(401)
      end

    end
  end

  context "unauthorized user" do 

    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    end

    describe "GET index" do 
      
      before { get :index }

      it "returns http success" do 
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.body).to eq([post].to_json)
      end
    end

    describe "GET show" do

      before { get :show, id: post.id }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns json content type" do
        expect(response.body).to eq(post.to_json)
      end
    end
    
  end
end
