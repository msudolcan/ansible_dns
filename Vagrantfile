# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

configs = YAML.load_file("net_config.yaml")
yaml_config = configs['machines']

Vagrant.configure("2") do |config|

    # Keep default key on all machines
    config.ssh.insert_key = false


    config.vm.define "develop" do |develop|
        develop.vm.box = "msodacan/ubuntu_bionic_x64"
        develop.vm.network "private_network", ip: yaml_config['develop']['ip']
        develop.vm.hostname = "develop"

          develop.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--groups", "/Network"]

            vb.name = "develop"
            vb.memory = 1024
            vb.cpus = 1
        end
    end

    config.vm.define "gitlab" do |gitlab|
        gitlab.vm.box = "msodacan/ubuntu_bionic_server"
        gitlab.vm.network "private_network", ip: yaml_config['gitlab']['ip']
        gitlab.vm.hostname = "gitlab.rcdt.net"

        gitlab.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--groups", "/Network/Servers"]

            vb.name = "gitlab"
            vb.memory = 4096
            vb.cpus = 2
        end
    end

    config.vm.define "wiki" do |wiki|
        wiki.vm.box = "msodacan/ubuntu_bionic_server"
        wiki.vm.network "private_network", ip: yaml_config['wiki']['ip']
        wiki.vm.hostname = "wiki.rcdt.net"

        wiki.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--groups", "/Network/Servers"]

            vb.name = "wiki"
            vb.memory = 4096
            vb.cpus = 2
        end
    end

    config.vm.define "dc" do |dc|
        dc.vm.box = "msodacan/ubuntu_bionic_server"
        dc.vm.network "private_network", ip: yaml_config['domain-controller']['ip']
        dc.vm.hostname = "server.rcdt.net"

        dc.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--groups", "/Network/Servers"]

            vb.name = "domain-controller"
            vb.memory = 4096
            vb.cpus = 2
        end

        dc.vm.provision "shell", path: "provision/apt_install_ansible.sh"
    end
end
