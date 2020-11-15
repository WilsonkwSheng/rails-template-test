def install_simple_form
  gem "simple_form"
  run "bundle install"
  if yes?("Install simple form with bootstrap config? Note: Make sure you have bootstrap install first")
    rails_command "generate simple_form:install --bootstrap"
  else
    rails_command "generate simple_form:install"
  end
end

install_simple_form
