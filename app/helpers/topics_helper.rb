module TopicsHelper
  def user_is_authorized_for_administration?
    current_user && current_user.admin?
  end

  def user_is_authorized_for_moderation?
    current_user && current_user.moderator?
  end
end
