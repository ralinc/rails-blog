module Authenticator
  def login(email, password)
    user = User.find_by(email: email.downcase)
    user.authenticate(password) if user
  end

  module_function :login
end
