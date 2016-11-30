echo "Starting installation..."

echo "Installing openssh-server..."

sudo apt-get update -y

sudo apt-get install -y openssh-server openssh-client

###Disabling firewall###

sudo ufw disable

##Installing puppet...###

echo "Installing puppet..."

sudo apt-get install -y puppet puppetmaster

###Configuring puppet...####

echo "Configuring master ip address..."

sudo sed -i "1s/^/$MASTER_IP $MASTER_DN puppetmaster\n/" /etc/hosts 
sudo sed -i "1s/^/127.0.0.1 $MASTER_DN puppetmaster\n/" /etc/hosts


sudo touch /etc/puppet/manifests/site.pp

###Configure node set-up###
sudo echo "node default { }" > /etc/puppet/manifests/site.pp
###First node(Project tracker,repository,Jenkins server)####
sudo echo "node '$agDN1' {" >> /etc/puppet/manifests/site.pp
sudo echo "	include git " >> /etc/puppet/manifests/site.pp
sudo echo "	include jira " >> /etc/puppet/manifests/site.pp
sudo echo "	include jenkins } " >> /etc/puppet/manifests/site.pp
###Second node(Maven, Jenkins, java)####
sudo echo "node '$agDN2' {include java" >> /etc/puppet/manifests/site.pp
sudo echo "	include maven " >> /etc/puppet/manifests/site.pp
sudo echo "	include jenkins } " >> /etc/puppet/manifests/site.pp
###Third node (Nexus,jenkins,java) -> Stores completed artefacts###
sudo echo "node '$agDN3' {include java" >> /etc/puppet/manifests/site.pp
sudo echo "	include nexus " >> /etc/puppet/manifests/site.pp
sudo echo "	include jenkins } " >> /etc/puppet/manifests/site.pp
#############################################################

sudo sed -i "16s/^/autosign=true\n/" /etc/puppet/puppet.conf

###Copying across modules###

sudo cp -r /tmp/shared/modules/java /etc/puppet/modules
sudo cp -r /tmp/shared/modules/jenkins /etc/puppet/modules
sudo cp -r /tmp/shared/modules/maven /etc/puppet/modules
sudo cp -r /tmp/shared/modules/bamboo /etc/puppet/modules
sudo cp -r /tmp/shared/modules/git /etc/puppet/modules
sudo cp -r /tmp/shared/modules/jira /etc/puppet/modules
sudo cp -r /tmp/shared/modules/nexus /etc/puppet/modules

echo "Your installation is complete!"