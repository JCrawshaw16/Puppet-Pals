class maven (
	$mvn_archive = "maven.tar.gz",
	$mvn_folder = "apache-maven-3.3.9",
	$mvn_home = "/opt/apache-maven-3.3.9/",
	$shared = "/tmp/shared/") {

	require java

	Exec {
		path => ["/usr/bin", "/bin", "/usr/sbin"]
	}

	exec { "extract maven":
		cwd => "${shared}",
		command => "tar zxfv ${mvn_archive}",
	}

	exec { "copy maven":
		cwd => "${shared}",
		command => "sudo cp -r ${mvn_folder} /opt/",
		require => Exec["extract maven"],
	}

	exec { "export maven":
		cwd => "/tmp/shared",
		provider => shell,
		command => "./mvn.sh",
		require => Exec["copy maven"],
	}
}
