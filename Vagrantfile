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
	  
	  # Jenkins & Sample-jenkin-app configurattion
	  node.vm.network "forwarded_port", guest: 8080, host: 7001   	# access jenkins server
	  node.vm.network "forwarded_port", guest: 8090, host: 18090   	# access sample-jenkins-app

	  # Sonarqube Server configurattion
	  node.vm.network "forwarded_port", guest: 9000, host: 9000   	# sonarqube ports
	  node.vm.network "forwarded_port", guest: 9092, host: 9092   	# sonarqube ports
	  
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
