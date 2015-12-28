class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each { |post|
      if 5 % post.id == 0
        post.title = "SPAM"
      end
    }
  end

  def show
  end

  def new
  end

  def edit
  end

end
