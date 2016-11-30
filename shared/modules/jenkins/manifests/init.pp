class jenkins ()

{

  Exec {
                path => ["/usr/bin","/bin","/usr/sbin"]
        }
		
		
		
		  exec { 'copy jenkins' :
                command => 'sudo cp /tmp/shared/jenkins_2.1_all.deb /opt',
		}
		
			exec { 'install jenkins2' :
                cwd => '/opt',
                command => 'sudo apt-get install -f -y',
                require => Exec['copy jenkins'],
        }
		
		exec {'install jenkins1':
				cwd => '/opt',
                command => 'sudo dpkg -i jenkins_2.1_all.deb',
				require => Exec['install jenkins2'],
		}
		
		

		
		    exec { 'install jenkins3' :
                cwd => '/opt',
                command => 'sudo apt-get install -y jenkins',
                require => Exec['install jenkins1'],
        }
		
		}
		