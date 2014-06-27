class UserMailer < ActionMailer::Base
  default from: "mayuri.kipl@gmail.com"
  
def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
end


end
