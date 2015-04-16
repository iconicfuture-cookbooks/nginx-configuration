# services

unless node['services'].nil?
    node['services'].each do |name, config|
        nginx_site "#{config['fqdn']}.conf" do
          enable true
          notifies :restart, "service[nginx]"
          notifies :restart, "service[php5-fpm]"
        end
        hostsfile_entry '127.0.0.1' do
          hostname  "#{config['fqdn']}"
          action    :append
        end
    end
end
