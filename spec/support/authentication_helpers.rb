module Authentication
  module TestHelpers
    def valid_session(user)
      session[:user_id] = user.id
    end
  end
end
