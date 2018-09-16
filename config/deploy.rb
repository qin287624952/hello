# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "hello"
set :deploy_user, 'deploy'
 
set :repo_url, "git@github.com:qin287624952/hello.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:application)}_#{fetch(:stage)}"
set :branch, :master
set :rvm_type, :user
set :rvm_ruby_string, :local
# set :rvm_map_bins, %w{gem rake ruby rails bundle}
# set :rvm_bin_path, "/home/#{fetch(:deploy_user)}/.rvm/bin"
 
# how many old releases do we want to keep, not much
set :keep_releases, 5
 
# files we want symlinking to specific entries in shared
set :linked_files, %w{config/database.yml config/secrets.yml}
 
# dirs we want symlinking to shared
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
 
namespace :deploy do
  after :finishing, 'deploy:cleanup'
end
