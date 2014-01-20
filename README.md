# Home.Pi Puppet 

Puppet Manifests for the Raspberry Pi

# Usage

    sudo apt-get install puppet

    git clone https://github.com/denschu/homepi-puppet.git

 or
 	cd home.pi-puppet
    scp -r . pi@192.168.192.29:home.pi-puppet

	sudo puppet apply --modulepath=/home/pi/home.pi-puppet/modules /home/pi/home.pi-puppet/manifests/site.pp --debug

# Helpful commands for manual setup on a Raspberry Pi

### Run Home.Pi on bootup

	/opt/node/bin/npm install forever -g
	sudo update-rc.d homepi defaults
	sudo update-rc.d -f  homepi remove


### Install and start MQTT Broker

	apt-get install mosquitto	
	sudo /etc/init.d/mosquitto start

### Setup WLAN

Show WLANs
	sudo iwlist scanning

Output (Example)
	IE: IEEE 802.11i/WPA2 Version 1
	Group Cipher : TKIP
	Pairwise Ciphers (2) : CCMP TKIP
	Authentication Suites (1) : PSK
	oder und
	IE: WPA Version 1
	Group Cipher : CCMP
	Pairwise Ciphers (1) : CCMP
	Authentication Suites (1) : PSK


Open config file
	sudo nano /etc/wpa_supplicant/wpa_supplicant.conf

Add lines to above config
	network={
	ssid="MYSSID" # replace!
	scan_ssid=1
	proto=RSN
	key_mgmt=WPA-PSK
	pairwise=CCMP #from above
	group=TKIP #from above
	psk="MYKES" # replace!
	}

Reboot
	sudo reboot

# Bugs

* build - wiringPi doesn't work
* make - rcswitch-pu doesn't work
* mosquitto must be installed manually