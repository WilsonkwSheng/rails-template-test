def source_paths
  Array(super) + [File.join(File.expand_path(File.dirname(__FILE__)), '../../resources')]
end

def install_rspec
  gem_group :development, :test do
    gem "rspec-rails"
  end
  run "bundle install"
  run "rails generate rspec:install"
  append_to_file "spec/rails_helper.rb", after: "require 'spec_helper'\n" do
    "require 'capybara/rspec'\n"
  end
  append_to_file "spec/rails_helper.rb", after: "require 'rspec/rails'\n" do
    "Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }\n"
  end

  install_factory_bot_faker_database_cleaner = ask("Do you wish to add the followings: [factorybot, faker, database_cleaner] with rspec? It is often use together. [y/n]")
  if install_factory_bot_faker_database_cleaner
    gem_group :development, :test do
      gem "database_cleaner"
      gem "factory_bot_rails"
      gem "faker"
    end
    run "bundle install"
    append_to_file "spec/rails_helper.rb", after: "RSpec.configure do |config|\n" do
      "\s\sconfig.include FactoryBot::Syntax::Methods\n"
    end
    copy_file 'database_cleaner.rb', 'spec/support/database_cleaner.rb'
  end

  install_time_cop = ask("Do you wish to add timecop to use with rspec? [y/n]")
  if install_time_cop
    gem_group :test do
      gem "timecop"
    end
    run "bundle install"
  end
end

install_rspec
