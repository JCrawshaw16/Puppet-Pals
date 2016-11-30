# Puppet-Pals

## The following files are required for the modules to run and should be added to the shared folder in the vagrant setup folder before using vagrant up:

* atlassian-bamboo-5.14.1.tar.gz
* java.tar.gz
* jenkins_2.1_all.deb
* jira.bin
* maven.tar.gz
* mysql-server_5.7.15-1ubuntu14.04_amd64.deb-bundle.tar
* nexus-3.0.2-02-unix.tar.gz

## Setup
Open up the vagrant file for editing and assign the ip addresses and domain names wanted at the top of the file as follows:
* Domain names => *.qac.local
* Ip addresses => 192.168.1.XXX

Check to see if the ip addresses are taken by opening up the command terminal on the host machine and using the 'ping' command e.g. ping 192.168.1.XXX

Edit the ip addresses in the vagrantfile as required

You are now ready to run 'vagrant up'
There may be problem with the network, if this occurs destroy the virtual machines with 'vagrant destroy' and wait a little while before trying vagrant up again
If this problem persists, consult dev; he knows (maybe, tell him not to lie)
