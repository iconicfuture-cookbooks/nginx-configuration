#
# Cookbook Name:: nginx-configuration
# Attributes:: default
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

default['nginx-configuration']['fastcgi_pass']            = '127.0.0.1:9000'
default['nginx-configuration']['client_max_body_size']    = '1m'
default['nginx-configuration']['fastcgi_connect_timeout'] = '2s'
default['nginx-configuration']['fastcgi_read_timeout']    = '5s'
