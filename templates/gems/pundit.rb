def install_pundit
  gem "pundit"
  run "bundle install"
  run "rails generate pundit:install"
  append_to_file "app/controllers/application_controller.rb", after: "class ApplicationController < ActionController::Base\n" do
    "\s\sinclude Pundit\n"
  end
end

install_pundit
