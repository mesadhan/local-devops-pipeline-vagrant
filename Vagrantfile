# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

	NodeName = "local-devops-pipeline"

	config.vm.define NodeName do |node|
	  node.vm.box = "ubuntu/bionic64"
	  node.vm.hostname = "#{NodeName}.example.com"
	  node.vm.network "private_network", ip: "172.42.42.110"
	  node.ssh.forward_agent = true
	  
	  node.vm.network "forwarded_port", guest: 8080, host: 7001   	# jenkins server
	  node.vm.synced_folder "data-vagrant", "/home/data-vagrant"
	  
	  node.vm.provider "virtualbox" do |v|
		v.name = NodeName
		v.memory = 2048
		v.cpus = 1
		v.gui = false
	  end
	end

	config.vm.provision :shell, :path => "docker-setup.sh"
	  
end
