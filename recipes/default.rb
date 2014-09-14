#
# Cookbook Name:: ccm
# Recipe:: default
#
# Copyright (C) 2014 MikeBThun 
#
# All rights reserved - The MIT License (MIT)
#

include_recipe 'python'

%w( pyYaml six ).each do |pip|
  python_pip pip
end

%w( vim git ant ).each do |package|
  apt_package package
end

git "/opt/ccm" do
  repository "https://github.com/pcmanus/ccm"
  revision "master"
  action :sync
end

execute "ccm" do
  command "cd /opt/ccm && python /opt/ccm/setup.py install && touch /opt/ccm/.installed"
  creates "/opt/ccm/.installed"
  action :run
end

