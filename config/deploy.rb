# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'e-purchase'
set :repo_url, 'ssh://git@gitlab.fslola.cn:8011/it/e-purchase.git'

set :deploy_to, '/rails_apps/e-purchase'
set :scm, :git

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
#set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

set :log_level, :info
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets public/uploads}

set :keep_releases, 5
set :pty, false
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        with rails_env: fetch(:stage) do
          execute :rake, 'tmp:clear'
        end
      end
    end
  end
end

