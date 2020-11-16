def install_bootstrap
  gem "bootstrap"
  run "bundle install"
  remove_file 'app/assets/stylesheets/application.css'
  run "touch app/assets/stylesheets/application.scss"
  append_to_file 'app/assets/stylesheets/application.scss' do
    '@import "bootstrap";'
  end
end

install_bootstrap
