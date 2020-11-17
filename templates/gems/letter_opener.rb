def install_letter_opener
  gem_group :development do
    gem "timecop"
  end
  run "bundle install"
end

install_letter_opener
