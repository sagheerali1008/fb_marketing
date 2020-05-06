module ApplicationHelper
  def is_admin? user
    user.has_role? :admin
  end
end
