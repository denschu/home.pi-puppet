# Home.Pi Puppet 

Puppet Manifests for the Raspberry Pi

# Usage

    sudo apt-get install puppet

    git clone https://github.com/denschu/homepi-puppet.git

    sudo cp -r puppet /etc/
    sudo puppet apply --modulepath=/etc/puppet/modules /etc/puppet/manifests/site.pp --debug

# Helpful commands for manual setup on a Raspberry Pi

### Run Home.Pi on bootup

	/opt/node/bin/npm install forever -g
	sudo update-rc.d homepi defaults
	sudo update-rc.d -f  homepi remove


### Install and start MQTT Broker

	apt-get install mosquitto	
	sudo /etc/init.d/mosquitto start