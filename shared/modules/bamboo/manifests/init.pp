class bamboo {
		
	Exec {
		path => ["/usr/bin","/bin","/usr/sbin",]
	}
	
	#exec { 'add user':	
	#	command => 'sudo useradd --create-home -c "Bamboo role account" bamboo'
	#}

	exec { 'make directory':	
		command => 'sudo mkdir -p /opt/atlassian/bamboo',
		#require => Exec['add user'],
	}

	#exec { 'ownership directory':
	#	command => 'sudo chown bamboo: /opt/atlassian/bamboo',
	#	require => Exec['make directory'],
	#}


	#exec { 'log in to user':
	#	command => 'sudo su - bamboo',
	#	require => Exec['add user'],
	#}
	
	exec { 'copy bamboo tar file':
		command => 'sudo cp /tmp/shared/atlassian-bamboo-5.14.1.tar.gz /opt/atlassian/bamboo',
		#require => Exec['make directory'],
	}

	exec { 'extract bamboo tar file':
		cwd => '/opt/atlassian/bamboo',
		command => 'sudo tar zxvf atlassian-bamboo-5.14.1.tar.gz',
		require => Exec['copy bamboo tar file'],
	}

	exec { 'install bamboo':
		cwd => '/opt/atlassian/bamboo',
		command => 'sudo ln -s atlassian-bamboo-5.14.1/ current',
		require => Exec['extract bamboo tar file'],
	}
	
	#exec {'exit':
	#	command => 'exit',
	#	require => Exec['install bamboo'],
	#}

	exec { 'start up process':
		cwd => '/opt/atlassian/bamboo/atlassian-bamboo-5.14.1/bin',
		command => 'sudo ./start-bamboo.sh',
		require => Exec['install bamboo'],
	}
}
