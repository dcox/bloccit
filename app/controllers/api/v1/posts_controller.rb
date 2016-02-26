class Api::V1::PostsController < Api::V1::BaseController
  def create
    post = Post.new(post_params)
    # post = Post.new
    # post.title = params[:post][:title]
    # post.body = params[:post][:body]
    # post.topic = params[:post][:topic]
    # post.user = params[:post][:user]

    if post.valid?
      post.save!
      render json: post.to_json, status: 201
    else
      render json: {"error" => "Post is invalid", "status" => 400}, status: 400
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user, :topic)
  end

end