#
# Cookbook:: cicd_pipeline
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'chocolatey::default'

chocolatey_packages = {
  'javaruntime' => '7.0.71',
  '7zip' => '19.0',
  'curl' => '7.68.0',
  'vscode' => '1.41.1',
  'windows-sdk-10.1' => '10.1.18362.1',
  'msbuild.communitytasks' => '1.4.0.74',
  'python2' => '2.7.17',
  'git' => '2.25.0',
}

chocolatey_packages.each do |package, package_version|
  chocolatey_package package do
    version package_version
    action :install
  end
end

cicd_env_vars = {
  'GIT_HOME' => 'C:\Program Files\Git\\',
  'GIT_SSH_VARIANT' => 'ssh',
  'FrameworkSDK10' => 'C:\Program Files (x86)\Windows Kits\10\\',
  'MSBuildComTasks' => 'C:\Program Files (x86)\MSBuild\MSBuildCommunityTasks\\',
}

cicd_env_vars.each do |var_name, var_value|
  env var_name do
    value var_value
  end
end
