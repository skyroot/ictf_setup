# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    #'internal boxes'
    config.env.enable
    config.vm.define("ubuntu_box") do |ubuntu_config|
        ubuntu_config.vm.box = "ubuntu/xenial64"
        ubuntu_config.vm.provision "shell"do |shell|
	    shell.path = "./setup.sh"
            shell.args =  "#{ENV['password_root']} #{ENV['password_ctf']}"
        end
    end
#    config.vm.provider "virtualbox" do |v|
#        v.cpus = 3
#        v.memory = 2056
#    end
end
