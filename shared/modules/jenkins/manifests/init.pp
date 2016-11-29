class jenkins ()

{

  Exec {
                path => ["/usr/bin","/bin","/usr/sbin"]
        }
		
		exec {'create new jenkins directory' :
				command => 'sudo mkdir /opt/jenkins',
		}
		
		  exec { 'copy jenkins' :
                command => 'sudo cp /tmp/shared/jenkins_2.1_all.deb /opt/jenkins',
				require => Exec['create new jenkins directory'],
        }
		
				    exec { 'install jenkins2' :
                cwd => '/opt/jenkins',
                command => 'sudo apt-get install -f',
                require => Exec['copy jenkins'],
        }
		
		exec {'install jenkins1':
				cwd => '/opt/jenkins',
                command => 'sudo dpkg -i jenkins_2.1_all.deb',
				require => Exec['install jenkins2'],
		}
		
		

		
		    exec { 'install jenkins3' :
                cwd => '/opt/jenkins',
                command => 'sudo apt-get install -y jenkins',
                require => Exec['install jenkins1'],
        }
		
		}
		
