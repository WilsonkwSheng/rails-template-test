def install_faker
  gem_group :development, :test do
    gem "faker"
  end
  run "bundle install"
end

install_faker
