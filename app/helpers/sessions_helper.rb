module SessionsHelper

 def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user2 = user
  end
  
  def current_user2=(user)
    @current_user2 = user
  end

  def current_user2
    @current_user2 ||= user_from_remember_token
  end

  def signed_in?
    !current_user2.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user2 = nil
  end
  
private

  def user_from_remember_token
    User.authenticate_with_salt(*remember_token)
  end

  def remember_token
    cookies.signed[:remember_token] || [nil, nil]
  end

  def deny_access
    redirect_to log_in_path, :notice => "Please sign in to access this page."
  end


end
