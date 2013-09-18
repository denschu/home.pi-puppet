#http://blog.rueedlinger.ch/2013/03/raspberry-pi-and-nodejs-basic-setup/
class nodejs {
    exec { 'download-nodejs':
        cwd     => '/home/pi',
        command => 'wget http://nodejs.org/dist/v0.10.2/node-v0.10.2-linux-arm-pi.tar.gz',
        path    => ['/usr/bin','/usr/local/bin','/opt/local/bin'],
        creates => '/home/pi/node-v0.10.2-linux-arm-pi.tar.gz',
        logoutput => true,
    }
    exec { 'tar-nodejs':
        cwd     => '/home/pi',
        command => 'tar xvzf node-v0.10.2-linux-arm-pi.tar.gz',
        path    => ['/bin'],
        creates => '/home/pi/node-v0.10.2-linux-arm-pi',
        require => Exec['download-nodejs'],
        logoutput => true,
    }
    file { "/opt/node":
        ensure => "directory",
        owner  => "root",
        group  => "root",
        mode   => 755,
    }
    exec { 'cp-nodejs':
        cwd     => '/home/pi',
        command => 'sudo cp -r node-v0.10.2-linux-arm-pi/* /opt/node',
        path    => ['/usr/bin','/usr/local/bin','/opt/local/bin'],
        creates => '/opt/node/bin',
        require => [Exec['tar-nodejs'],File['/opt/node']],
        logoutput => true,
    }
    file { "/etc/profile.d/set_nodejs_home.sh":
        ensure => present,
        source => "puppet:///modules/nodejs/set_nodejs_home.sh",
        owner  => "root",
        group  => "root",
        mode   => 755,
    }
}