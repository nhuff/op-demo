# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant::Config.run do |config|
  config.vm.box = "centos6"
  config.vm.host_name='op.vm'
  config.vm.forward_port 80, 8080
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "op.pp"
    puppet.options = "--verbose"
  end
end
