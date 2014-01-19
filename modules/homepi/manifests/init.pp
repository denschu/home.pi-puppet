class homepi {
    package { "git":
        ensure => "latest"
    }

    exec { "git-clone-wiringpi":
        path    => ['/usr/bin','/usr/local/bin','/opt/local/bin'],
        command => "git clone git://git.drogon.net/wiringPi /home/pi/wiringPi",
        user  => 'pi',
        group  => 'pi',
        onlyif  => "test ! -d /home/pi/wiringPi",
        require => Package['git'],
    }

    exec { 'build-wiringpi':
        cwd     => '/home/pi/wiringPi',
        command => 'build',
        onlyif  => 'test ! -x /home/pi/wiringPi/gpio/gpio',
        path    => ['/bin', '/usr/bin', '/usr/local/bin', '/usr/sbin', '/sbin', ],
        creates => '/home/pi/wiringPi/gpio/gpio',
        require => Exec['git-clone-wiringpi'],
        logoutput => true,
    }

    exec { "git-clone-rcswitch-pi":
        path    => ['/usr/bin','/usr/local/bin','/opt/local/bin'],
        command => "git clone git://github.com/denschu/rcswitch-pi /home/pi/rcswitch-pi",
        user  => 'pi',
        group  => 'pi',
        onlyif  => "test ! -d /home/pi/rcswitch-pi",
        require => Package['git'],
    }

    exec { 'build-rcswitch':
        cwd     => '/home/pi/rcswitch-pi',
        command => 'make',
        path    => ['/usr/bin','/usr/local/bin','/opt/local/bin'],
        creates => '/home/pi/rcswitch-pi/send',
        require => Exec['git-clone-rcswitch-pi'],
        logoutput => true,
    }

    file { "/var/log/homepi.log":
        ensure => "file",
        owner  => "root",
        group  => "root",
        mode   => 777,
    }

    file { "/etc/init.d/homepi":
        owner  => root,
        group  => root,
        mode   => 0755,
        source => "puppet:///modules/homepi/homepi.sh",
        notify => Service["homepi"],
    }

    service { "homepi":
       ensure  => running,
       enable  => true,
       hasstatus  => false,
    }
}