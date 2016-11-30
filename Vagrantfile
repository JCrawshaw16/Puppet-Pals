# -*- mode: ruby -*-
# vi: set ft=ruby :
##################################################################
###Set domain names and ipaddress's for master and agents#########
##################################################################
MASTER_DN = "jcmaster.qac.local"
agDN1 = "jcagent1.qac.local"
agDN2 = "jcagent2.qac.local"
agDN3 = "jcagent3.qac.local"
MASTER_IP = "192.168.1.75"
agIP1 = "192.168.1.76"
agIP2 = "192.168.1.77"
agIP3 = "192.168.1.78"

##################################################################
##################################################################

Vagrant.configure("2") do |config|
	
	config.vm.box ="chad-thompson/ubuntu-trusty64-gui"
    config.vm.synced_folder "shared", "/tmp/shared"
       
    config.vm.define "master" do |master|
        master.vm.hostname = MASTER_DN
        master.vm.network :public_network, ip: MASTER_IP
        master.vm.provision :shell, path: "bootstrap_master.sh", env: {"MASTER_IP" => MASTER_IP, "MASTER_DN" => MASTER_DN, "agDN1" => agDN1, "agDN2" => agDN2, "agDN3" => agDN3}
		
        master.vm.provider :virtualbox do |masterVM|
            masterVM.gui = true
            masterVM.name = "master"
            masterVM.memory = 4096
            masterVM.cpus = 2
        end
    end
   
    config.vm.define "agent1" do |agent1|
        agent1.vm.hostname = agDN1
        agent1.vm.network :public_network, ip: agIP1
        agent1.vm.provision :shell, path: "bootstrap_agent.sh", env: {"MASTER_IP" => MASTER_IP, "MASTER_DN" => MASTER_DN}
        agent1.vm.provider :virtualbox do |agentVM|
            agentVM.gui = true
            agentVM.name = "agent1"
            agentVM.memory = 4096
            agentVM.cpus = 2
        end
    end
    
	config.vm.define "agent2" do |agent2|
        agent2.vm.hostname = agDN2
        agent2.vm.network :public_network, ip: agIP2
        agent2.vm.provision :shell, path: "bootstrap_agent.sh", env: {"MASTER_IP" => MASTER_IP, "MASTER_DN" => MASTER_DN}
        agent2.vm.provider :virtualbox do |agentVM|
            agentVM.gui = true
            agentVM.name = "agent2"
            agentVM.memory = 4096
            agentVM.cpus = 2
        end
    end
	
	config.vm.define "agent3" do |agent3|
        agent3.vm.hostname = agDN3
        agent3.vm.network :public_network, ip: agIP3
        agent3.vm.provision :shell, path: "bootstrap_agent.sh", env: {"MASTER_IP" => MASTER_IP, "MASTER_DN" => MASTER_DN}
        agent3.vm.provider :virtualbox do |agentVM|
            agentVM.gui = true
            agentVM.name = "agent3"
            agentVM.memory = 4096
            agentVM.cpus = 2
        end
    end
	
	
end