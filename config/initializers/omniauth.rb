OmniAuth.config.logger = Rails.logger
OmniAuth.config.full_host = "http://tunemycity.herokuapp.com"
Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, '222826711229885','25f226f75be1de93dd8813e5654848bf'
   provider :google_oauth2, '149757084195-p06ril3lck9068jbs9o7n92tpduue5j4.apps.googleusercontent.com', '6HbUCMBY8hJmSx8EsMaesF5Z', {:access_type => 'online', :approval_prompt => '', :client_id => 'localhost'}
   provider :twitter, "a2VuvK6lO01UGJEKOZvGPwkhp", "C1AsX6uyrQNpmasKJ4kcb0vps3KH8bXgrbWKgEUQZ4t9TtPDt4", {:access_type => 'online', :approval_prompt => '', :client_id => 'localhost'}
end

