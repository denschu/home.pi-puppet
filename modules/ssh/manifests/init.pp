class ssh {
	file { "/home/pi/.ssh":
	    ensure => 'directory',
	    owner => 'pi',
	    mode => '700',
	}

    ssh_authorized_key { "pi-rsa-key":
	   ensure => 'present',
	   key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDHcGWBU+SkUw1gsD3y/ly/xAOhFGDheR4vkB6Qacy82Fcu7yOIoX1sKjadsKIDSCJm5LtDXL2Mb0nza4irpn3NpiNL4Ay503uUqYWt4OXSYVj6asiqhgaBsfqWxwsWxZIeHNS+vBoVzHPkvCwArLHsblss/GKxzSnA4j62J8pAVVKgBjJZlM+oVJA7WDzoK5//g48S8SRIfjPdVErqo7hTAlAK0WZfExn9+y6yMFQd0yz6LWXTif+aYlKTh7yf85dhVNVMHlLZV1T6DJqS17brYtNtBu24sqzOvdsLekCqIPs4gpHh1JfndQFMBt9CEjBCrfyiWn8w1p64hMFVEX47',
	   type => 'rsa',
	   user => 'pi',
	   require => File["/home/pi/.ssh"],
	}
}