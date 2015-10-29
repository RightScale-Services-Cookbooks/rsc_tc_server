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

tcruntime_instance 'tcruntime-8081' do
  java_home '/usr/java'
  properties [{ 'bio.http.port' => '8081' }, { 'bio.httpS.port' => '8444' }, { 'base.jmx.port' => '6970' }]
  templates ['bio', 'bio-ssl']
end
