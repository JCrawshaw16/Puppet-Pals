class mysql {
 file {'/opt/mysql-bundle.tar':
  ensure => present,
  source => '/tmp/shared/mysql-server_5.7.15-1ubuntu14.04_amd64.deb-bundle.tar',
  owner => 'root',
  group => 'root',
  before => Exec['/opt/server.sh'],
 }

 file {'/opt/dependencies.sh':
  ensure => 'file', 
  content => '#!/bin/bash
sudo apt-get update -y
sudo apt-get -f install -y
sudo apt-get install libmecab2 -y
sudo apt-get install -y libaio1',
  path => '/opt/dependencies.sh',
  owner => 'root',
  group => 'root',
  mode => '0700',
  before => Exec['/opt/dependencies.sh'],
 }

 file {'/opt/server.sh':
  ensure => 'file',
  content => '#!/bin/bash
sudo cp /tmp/shared/mysql-server_5.7.15-1ubuntu14.04_amd64.deb-bundle.tar /opt/
cd /opt/
sudo tar -xvf mysql-server_5.7.15-1ubuntu14.04_amd64.deb-bundle.tar
sudo DEBIAN_FRONTEND=noninteractive dpkg-preconfigure mysql-community-server_5.7.15-1ubuntu14.04_amd64.deb',
  path => '/opt/server.sh',
  owner => 'root',
  group => 'root',
  mode => '0700',
  before => Exec['/opt/server.sh'],
 }

 file {'/opt/install.sh':
  ensure => 'file',
  content => '#!/bin/bash
cd /opt
sudo dpkg -i mysql-{common,community-client,client,community-server,server}_*.deb',
  path => '/opt/install.sh',
  owner => 'root',
  group => 'root',
  mode => '0700',
  before => Exec['/opt/install.sh'],
 }


 exec {'/opt/dependencies.sh':
  provider => shell,
  before => Exec['/opt/server.sh'],
 }

 exec {'/opt/server.sh':
  provider => shell,
  before => Exec['/opt/install.sh'],
 }

 exec {'/opt/install.sh':
  provider => shell,
  onlyif => '! mysql -V',
 }
}
