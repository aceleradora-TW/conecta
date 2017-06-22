UserSessionInfo = Struct.new(:name, :is_admin, :is_logged_in)

class SessionService
  def find_user_by(email: email, password: password)
    user = User.first(email: email)
    if user && user.password == password
      return user
    end
    return nil
  end

  def set_user_session session, user
    session[:user] = user
  end

  def get_user_session_info(session)
    user = session[:user]
    user_info = UserSessionInfo.new
    if(user)
      user_info.is_logged_in = true
      user_info.name = user.name
      user_info.is_admin = user.is_admin
    else
      user_info.is_logged_in = false
      user_info.name = nil
      user_info.is_admin = false
    end
    return user_info
  end
end
