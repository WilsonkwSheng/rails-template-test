def install_pages
  run "rails generate controller Pages index"
  gsub_file 'config/routes.rb', "get 'pages/index'", "root 'pages#index'"
end

install_pages
