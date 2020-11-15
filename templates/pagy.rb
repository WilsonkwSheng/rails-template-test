def install_pagy
  gem "pagy"
  run "bundle install"
  initializer "pagy.rb"
  append_to_file "app/controllers/application_controller.rb", after: "class ApplicationController < ActionController::Base\n" do <<-'RUBY'
  include Pagy::Backend
  RUBY
  end
end

install_pagy
