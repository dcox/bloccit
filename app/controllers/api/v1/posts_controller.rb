class Api::V1::PostsController < Api::V1::BaseController
  before_action :authenticate_user
  before_action :authorize_user, except: [:index, :show]

  def index
    posts = Post.all
    render json: posts.to_json, status: 200
  end

  def show
    post = Post.find(params[:id])
    comments = post.comments.all
    post = post.to_json
    comments = comments.to_json
    post = post + comments
    render json: post, status: 200
  end
end
