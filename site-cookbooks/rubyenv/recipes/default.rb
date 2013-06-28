#
# Cookbook Name:: rubyenv
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'nodejs::default'
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "2.0.0-p195" do
  ruby_version "2.0.0-p195"
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.0.0-p195"
end

rbenv_gem "rake" do
  ruby_version "2.0.0-p195"
end

package "libsqlite3-dev"

ruby ssh_known_hosts_entry 'github.com'

git "/vagrant/fijiportal" do
 repository "git@github.com:rob0t7/fijiportal.git"
  action :checkout
end
