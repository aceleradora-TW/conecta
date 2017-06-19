class SessionService
  def find_user_by(email: email, password: password)
    user = User.first(email: email)
    if user && user.password == password
      return user
    end
    return nil
  end
end
