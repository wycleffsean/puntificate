require 'sidekiq/capistrano'

set :user, "deployer"
set :scm_username, "wycleffsean"
#set :use_sudo, false
default_run_options[:pty] = true

set :application, "puntificate"
set :repository,  "git@github.com:wycleffsean/puntificate.git"
set :ssh_options, { :forward_agent => true }

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www"

role :web, "198.199.95.73"                          # Your HTTP server, Apache/etc
role :app, "198.199.95.73"                          # This may be the same as your `Web` server
role :db,  "198.199.95.73", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:

set :rails_env, :production
set :unicorn, "bundle exec unicorn"
set :unicorn_pid, "/var/www/shared/pids/unicorn.pid"
set :unicorn_config, "#{current_path}/config/unicorn.rb"

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{try_sudo} #{unicorn} -c #{unicorn_config} -E #{rails_env} -D"
  end
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end
  task :restart_hard, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end
