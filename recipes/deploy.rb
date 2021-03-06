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
unless node['sites'].nil?
    node['sites'].each do |name, config|
        unless config['nginx'].nil?
            template "#{node['nginx']['dir']}/sites-available/#{config['fqdn']}.conf" do
                source "#{config['nginx']['vhost_template']}"
                owner "root"
                group "root"
                mode 00644
                variables( :config => config )
            end
        end
    end
end
