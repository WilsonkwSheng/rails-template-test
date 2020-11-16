def install_dotenv
  gem 'dotenv-rails', groups: [:development, :test]
  run "bundle install"
  run "touch .env"
  run "touch .env.example" if yes?("Init .env.example?")
  append_to_file '.gitignore', after: ".byebug_history\n" do
    '.env'
  end
end

install_dotenv
