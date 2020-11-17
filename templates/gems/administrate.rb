def install_administrate
  gem "administrate"
  run "bundle install"
  run "rails generate administrate:install"
end

install_administrate
