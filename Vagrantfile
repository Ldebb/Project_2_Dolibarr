# -*- mode: ruby -*-
# vi: set ft=ruby sw=2 st=2 et :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.box_check_update = false

  # Limiter la RAM des VM
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1200"
    vb.gui = false
  end

  # Mettre en place un cache pour APT
  # config.vm.synced_folder 'v-cache', '/var/cache/apt'
 
  config.vm.define 'control' do |machine|
    machine.vm.hostname = 'control'
    machine.vm.network "private_network", ip:"192.168.50.250"
    machine.vm.network "forwarded_port", "guest": 1234, host:1080
    machine.vm.network "forwarded_port", "guest": 8080, host:8080
    machine.vm.network "forwarded_port", "guest": 3306, host:3306
  end

  config.vm.provision "shell", path: "provisioning.sh"
end
