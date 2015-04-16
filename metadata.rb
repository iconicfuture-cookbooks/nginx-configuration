name             "nginx-configuration"
maintainer_email "thomas.liebscher@iconicfuture.com"
maintainer       "Thomas Liebscher"
license          "Apache Software License 2.0"
description      "Configure nginx sites"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

depends 'nginx'
depends 'hostsfile'

%w{ ubuntu debian }.each do |os|
  supports os
end
