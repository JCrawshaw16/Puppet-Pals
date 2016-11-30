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

## Potential problems
Some major errors you may encounter are:
- The IP address may change upon installation when 'vagrant up' is run. This affects the setup of Jira, so to fix this, locate the agent that Jira lies on, open terminal and type in command 'facter ipaddress_eth1'. Using the IP address returned from the command, you use that IP address, enter it into your URL on your web browser, followed by ':8081' which is the port that Jira is connected to. This should open up Jira for you to use.
- Major network issues reassigning random IP addresses to agents; may need to run 'ifconfig ipaddress_eth1' to find actual IP address
