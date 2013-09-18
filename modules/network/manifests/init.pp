class network {
    Package {
        ensure => latest,
    }
    package {
    	"netatalk":;
    	"avahi-daemon":;
    }
    service {
        "netatalk":
             ensure => running;
    }
    service {
        "avahi-daemon":
            ensure => running;
    }
}