#
# Cookbook Name:: rsc_tc_server
# Recipe:: default
#
# Copyright (C) 2014 RightScale Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

yum_package 'java-openjdk'

get_java_home = Mixlib::ShellOut.new('$(readlink -f $(dirname $(readlink -f $(which java) ))/../)')
get_java_home.run_command

java_home = get_java_home.stdout

Chef::Log.info("JAVA_HOME #{java_home} #{get_java_home.stdout}" )

directory '/usr/java' do
end

link '/usr/java/bin' do
  to "#{java_home}/bin"
  link_type :symbolic
end

include_recipe 'pivotal_repo::default'

tcruntime_instance 'tcruntime-8081' do
  java_home "#{java_home}"
  properties [{ 'bio.http.port' => '8081' }, { 'bio.httpS.port' => '8444' }, { 'base.jmx.port' => '6970' }]
  templates ['bio', 'bio-ssl']
end
