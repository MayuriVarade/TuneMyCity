ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "localhost",
  :authentication => :login,
  :user_name => "mayuri.kipl@gmail.com",
  :password => "ankitakipl"
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"