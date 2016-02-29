# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
#
host_name = ARGV[1]

Vagrant.configure("2") do |config|

  # make sure that 2nd parameter is defined
  if (host_name=="")
    host_name='web.hybris.dev.i-99999999.devops.redspot.internal'
  end


  # Use a dynamic hostname in order to set the host via the command line
  # Not sure I like this but lets see how we go.
  config.vm.define :"#{host_name}", primary: true do |mmconfig|
    mmconfig.vm.box = "ubuntu/trusty64"
  end


  config.vm.define "web" do |web|
  	config.vm.hostname = 'web.hybris.dev.i-99999999.devops.redspot.internal'
   	config.vm.network "private_network", ip: "192.168.33.11"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end

   config.vm.provision "shell", inline: <<-SHELL
   set -xv
   echo '192.168.33.10  puppet  puppet.redspot.internal' >> /etc/hosts
    curl --retry 10000 --retry-delay 5 -q -s -k https://puppet:8140/packages/current/install.bash | sudo bash
   puppet agent --test --environment=dev --waitforcert 60 
   SHELL

  end


  config.vm.define "puppet" do |puppet|
    config.vm.hostname = 'puppet.redspot.internal'
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.network "forwarded_port", guest: 3000, host:3000    
    config.vm.network "forwarded_port", guest: 443, host:8443
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "4500"
    end

    config.vm.provision "shell", inline: <<-SHELL
     echo '192.168.33.10  puppet  puppet.redspot.internal' >> /etc/hosts
     cd /vagrant/puppet-enterprise-2015.3.1-ubuntu-14.04-amd64/
     ./puppet-enterprise-installer -A answers.txt
    SHELL
    
  end



end
