def source_paths
  Array(super) + [File.join(File.expand_path(File.dirname(__FILE__)), '../../resources')]
end

def install_sidekiq
  gem "sidekiq"
  run "bundle install"
  copy_file 'sidekiq.yml', 'config/sidekiq.yml'
end

install_sidekiq
