#
# Cookbook:: cicd_pipeline
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'chocolatey::default'

chocolatey_package '7zip' do
  action :install
  version '19.0'
end

chocolatey_package 'curl' do
  action :install
  version '7.68.0'
end

chocolatey_package 'vscode' do
  action :install
  version '1.41.1'
end

chocolatey_package 'git' do
  action :install
  version '2.25.0'
end

chocolatey_package 'javaruntime' do
  action :install
  version '7.0.71'
end

chocolatey_package 'python2' do
  action :install
  version '2.7.17'
end

chocolatey_package 'msbuild.communitytasks' do
  action :install
  version '1.4.0.74'
end

cicd_env_vars = {
  'GIT_HOME' => 'C:\Program Files\Git\\',
  'GIT_SSH_VARIANT' => 'ssh',
  'MSBuildComTasks' => 'C:\Program Files (x86)\MSBuild\MSBuildCommunityTasks\\',
}

cicd_env_vars.each do |var_name, var_value|
  env var_name do
    value var_value
  end
end
