echo "Starting installation..."


###Install updates#####
echo "Installing openssh-server..."

sudo apt-get update -y

sudo apt-get install -y openssh-server openssh-client

###Disable firewall######
echo "Disabling firewall..."

sudo ufw disable

###Install puppet#########

echo "Installing puppet..."

sudo apt-get install -y puppet

agFDQN=$(facter fqdn)
agIP=$(facter ipaddress_eth1)

###Configure puppet master-agent relationship###

sudo sed -i "1s/^/$agIP $agFDQN puppet\n/" /etc/hosts 
sudo sed -i "1s/^/127.0.0.1 $agFDQN puppet\n/" /etc/hosts
sudo sed -i "1s/^/$MASTER_IP $MASTER_DN puppetmaster\n/" /etc/hosts

###Edit puppet config file###

sudo sed -i "2s/^/server=$MASTER_DN\n/" /etc/puppet/puppet.conf

###Request certificates###

sudo puppet agent --test --server="$MASTER_DN"
sudo puppet agent --enable



echo "Your installation is complete!"
