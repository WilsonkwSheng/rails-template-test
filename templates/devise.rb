def install_devise
  gem "devise"
  run "bundle install"
  run "rails generate devise:install"
  environment 'config.action_mailer.default_url_options = { host: "localhost", port: 3000 }', env: 'development'
  model_name = ask("What do you want to name the devise model? Hint: Click Enter to use User")
  model_name = "User" if model_name.blank?
  run "rails generate devise #{model_name}"
end

install_devise
