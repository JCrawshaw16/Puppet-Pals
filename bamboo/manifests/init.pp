class bamboo {
		
	Exec {
		path => ["/usr/bin","/bin","/usr/sbin",]
	}

	exec { 'add user':	
		command => 'sudo useradd --create-home -c "Bamboo role account4" bamboo4'
	}

	exec { 'make directory':	
		command => 'sudo mkdir -p /opt/atlassian/bamboo',
		require => Exec['add user'],
	}

	exec { 'ownership directory':
		command => 'sudo chown bamboo: /opt/atlassian/bamboo',
		require => Exec['make directory'],
	}

	exec { 'log in to user':
		command => 'sudo su -bamboo4',
		require => Exec['add user'],
	}
	
	exec { 'copy bamboo tar file':
		command => 'sudo cp /etc/puppet/modules/bamboo/files/bamboo-5.14.1.tar.gz /opt/atlassian/bamboo',
		require => Exec['make directory'],
	}

	exec { 'extract bamboo tar file':
		cwd => '/opt',
		command => 'sudo tar zxvf bamboo-5.14.1.tar.gz',
		require => Exec['copy bamboo tar file'],
	}

	exec { 'install bamboo':
		require => Exec['extract bamboo tar file'],
		command => 'sudo in -s atlassian-bamboo-5.14.1',
	}
}