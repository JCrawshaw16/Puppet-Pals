class nexus (
		$NEXUS_HOME ="/opt/nexus",
)
		{
        Exec {
                path => ["/usr/bin","/bin","/usr/sbin"]
        }

      
		
		exec {'create new directory' :
				command => 'sudo mkdir /opt/nexus'
		}
		
		  exec { 'copy nexus tar file' :
                command => 'sudo cp /tmp/shared/nexus-3.0.2-02-unix.tar.gz /opt/nexus',
				require => Exec['create new directory'],
        }

        exec { 'extract nexus tar file' :
                cwd => '/opt/nexus',
                command => 'sudo tar zxvf nexus-3.0.2-02-unix.tar.gz',
                require => Exec['copy nexus tar file'],
        }

        exec { 'install nexus1' :
				cwd => '/opt/nexus/nexus-3.0.2-02/bin',
				command => 'sudo ./nexus run &',
				require => Exec['extract nexus tar file'],
        }
		
}
