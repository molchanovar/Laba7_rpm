# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.box_version = "2004.01"

  config.vm.provider "virtualbox" do |v|
    v.memory = 256
    v.cpus = 1
  end

  config.vm.define "distribution" do |distrib|
    distrib.vm.network "private_network", ip: "192.168.210.2", virtualbox__intnet: "net1"
    distrib.vm.hostname = "distribution"
	distrib.vm.provision "shell", path: "CreateRPM_script.sh"
  end

end
