# Home.Pi Puppet 

Puppet Manifests for the Raspberry Pi

# Usage

    sudo apt-get install puppet

    git clone https://github.com/denschu/homepi-puppet.git

    sudo cp -r puppet /etc/
    sudo puppet apply --modulepath=/etc/puppet/modules /etc/puppet/manifests/site.pp --debug