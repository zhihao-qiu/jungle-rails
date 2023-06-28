Rails.configuration.basic_auth = {
  :username => ENV['HTTP_BASIC_AUTH_USERNAME'],
  :password => ENV['HTTP_BASIC_AUTH_PASSWORD']
}

