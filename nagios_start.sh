#!/bin/bash

/etc/init.d/ncpa_listener start

echo "Container ready:"
echo "   NCPA Listener      --  Port 5693"
tail -f /usr/local/ncpa/var/log/ncpa_listener.log
