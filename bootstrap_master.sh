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

sudo sed -i "16s/^/autosign=true\n/" /etc/puppet/puppet.conf


echo "Your installation is complete!"