#
# Cookbook Name:: nginx-configuration
# Recipe:: configure
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'configure_applications'
include_recipe 'configure_services'
include_recipe 'configure_sites'

hostsfile_entry '192.168.10.1' do
  hostname  "local.development"
  action    :append
end

hostsfile_entry '127.0.0.2' do
  hostname  "#{appconfig['fqdn']}"
  action    :append
end
