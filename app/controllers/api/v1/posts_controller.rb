class Api::V1::PostsController < Api::V1::BaseController
  def create
    post = Post.new(post_params)

    if post.valid?
      post.save!
      render json: post.to_json, status: 201
    else
      p post.errors
      render json: {"error" => "Post is invalid", "status" => 400}, status: 400
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :topic_id)
  end

end
