module UsersHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end

  def detect_posts(user)
    user.posts.count > 0
  end

  def detect_comments(user)
    user.comments.count > 0
  end
end
