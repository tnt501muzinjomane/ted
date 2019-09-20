require "bundler/capistrano"

set :default_environment, {
    'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH",
   
}

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/mysql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"

server "portal.tourismauthority.org.sz", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "tourismV1"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :ssh_options, {
 config: false
}
set :scm, "git"
set :repository, "git@github.com:realnetdev/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true



after "deploy", "deploy:cleanup" # keep only the last 5 releases
after "deploy:create_symlink", "deploy:migrate"
