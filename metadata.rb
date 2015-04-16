name             "nginx-configuration"
maintainer_email "mathias.latzko@iconicfuture.com"
maintainer       "Mathias Latzko"
license          "Apache 2.0"
description      "Configure nginx vhosts for a application."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends 'nginx'
depends 'hostsfile'

%w{ ubuntu debian }.each do |os|
  supports os
end
