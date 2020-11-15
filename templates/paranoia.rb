def install_paranoia
  gem "paranoia"
  run "bundle install"
  return puts "Installation completed" unless yes?("Installation complete. You may choose to manually generate migration or use this template to continue generate migration [one time only] (y/yes)")

  model_name = ask("Which model do you wish to archive?. Hint: User or JobApplication or JobSeeker")
  return puts "No model was chosen. Installation completed." if model_name.blank?

  run "rails generate migration AddDeletedAtTo#{model_name.titleize.split.join}s deleted_at:datetime:index"
  append_to_file "app/models/#{model_name.parameterize.underscore}.rb", after: "class #{model_name.titleize.split.join} < ApplicationRecord\n" do <<-'RUBY'
  acts_as_paranoid
  RUBY
  end

  puts "For future reference follow these 3 steps:"
  puts "Run migration for paranoia"
  puts "Insert acts_as_paranoid line to model"
  puts "Run db:migrate"
  puts "For more assistance visit https://github.com/rubysherpas/paranoia"
  puts "Installation completed"
end

install_paranoia
