#
# Cookbook Name:: nginx-configuration
# Recipe:: vhost-configure
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

#
# Create vhosts configuration for Nginx.
#
unless node['applications'].nil?
    node['applications'].each do |name, config|
        template "#{node['nginx']['dir']}/sites-available/#{config['fqdn']}.conf" do
            source "#{config['vhost_template']}"
            owner "root"
            group "root"
            mode 00644
            variables( :config => config )
        end
    end
end

#
# Enable vhosts configuration for Nginx and append a entry to hosts file.
#
unless node['applications'].nil?
    node['applications'].each do |name, config|
        nginx_site "#{config['fqdn']}.conf" do
            enable true
            notifies :restart, "service[nginx]"
        end
        hostsfile_entry '127.0.0.1' do
            hostname "#{config['fqdn']}"
            action :append
        end
    end
end
