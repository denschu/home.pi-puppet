#! /bin/sh
# /etc/init.d/homepi

### BEGIN INIT INFO
# Provides:          homepi
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Starts homepi at boot
# Description:       A script which will start / stop homepi at boot / shutdown.
### END INIT INFO

# If you want a command to always run, put it here

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting homepi"
    # run application you want to start
    NODE_JS_HOME="/opt/node"
    PATH="$PATH:$NODE_JS_HOME/bin"
    export PATH
    export MQTT_BROKER_URL=mqtt://localhost:1883
    export NODE_ENV=production
    /opt/node/bin/forever start /home/pi/home.pi/server.js -l /var/log/homepi.log
    /opt/node/bin/forever start /home/pi/mqtt-exec/mqtt-exec.js -l /var/log/mqtt-exec.log
    /opt/node/bin/forever start /home/pi/mqtt-suntimes/mqtt-suntimes.js -l /var/log/mqtt-suntimes.log
    /opt/node/bin/forever start /home/pi/mqtt-rules/mqtt-rules.js -l /var/log/mqtt-rules.log
    /opt/node/bin/forever start /home/pi/mqtt-zway/mqtt-zway.js -l /var/log/mqtt-zway.log
    ;;
  stop)
    echo "Stopping homepi"
    # kill application you want to stop
    #killall node
    NODE_JS_HOME="/opt/node"
    PATH="$PATH:$NODE_JS_HOME/bin"
    export PATH
    /opt/node/bin/forever stopall
    ;;
  *)
    echo "Usage: /etc/init.d/homepi {start|stop}"
    exit 1
    ;;
esac

exit 0
