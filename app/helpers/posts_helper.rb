module PostsHelper
  def user_is_authorized_for_post_administration?(post)
    current_user && (current_user == post.user) || current_user.admin?
  end

  def user_is_authorized_for_post_moderation?(post)
    current_user && (current_user == post.user) || current_user.moderator?
  end
end
