class jenkins ()

{

  Exec {
                path => ["/usr/bin","/bin","/usr/sbin"]
        }
		
		
		
		exec { 'copy jenkins' :
                command => 'sudo cp /tmp/shared/jenkins_2.1_all.deb /opt',
		}
		
		exec { 'add key':
				cwd => '/opt',
				command => 'wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -',
		}
		
		exec {'update source list:
				command => sh -c 'echo deb /opt/jenkins_2.1_all.deb > /etc/apt/sources.list.d/jenkins.list',
		
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
		
		
		   # exec { 'install jenkins3' :
            #    cwd => '/opt',
             #   command => 'sudo apt-get install -y jenkins',
              #  require => Exec['install jenkins1'],
        #}
		
		}
		