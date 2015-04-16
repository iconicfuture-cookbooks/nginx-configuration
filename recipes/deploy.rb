#
# Cookbook Name:: nginx-configuration
# Recipe:: deploy
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
            source "default-application-site.erb"
            owner "root"
            group "root"
            mode 00644
            variables( :config => config )
        end
    end
end

unless node['services'].nil?
    node['services'].each do |name, config|
        template "#{node['nginx']['dir']}/sites-available/#{config['fqdn']}.conf" do
            source "default-service-site.erb"
            owner "root"
            group "root"
            mode 00644
            variables( :config => config )
        end
    end
end

