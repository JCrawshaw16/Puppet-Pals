class nexus (
		$NEXUS_HOME ="/opt/nexus",
)
		{
        Exec {
                path => ["/usr/bin","/bin","/usr/sbin"]
        }

    
		
		  exec { 'copy nexus tar file' :
                command => 'sudo cp /tmp/shared/nexus-3.0.2-02-unix.tar.gz /opt',
        }

        exec { 'extract nexus tar file' :
                cwd => '/opt',
                command => 'sudo tar zxvf nexus-3.0.2-02-unix.tar.gz',
                require => Exec['copy nexus tar file'],
        }

        exec { 'install nexus1' :
				cwd => '/opt/nexus-3.0.2-02/bin',
				command => 'sudo ./nexus run &',
				require => Exec['extract nexus tar file'],
        }
		
}