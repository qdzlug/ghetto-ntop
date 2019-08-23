#!/bin/bash

service redis-server start

/usr/local/bin/nprobe --zmq tcp://0.0.0.0:5556 -i none -n none --collector-port 2055 -V 9 --verbose 1&

/usr/local/bin/ntopng -r localhost --online-license-check -S local -i tcp://localhost:5556 --disable-login=1 --dns-mode=1 -m "192.168.0.0/16" -F 'es;ntopng;ntopng-%Y.%m.%d;http://elastagirl.virington.com/_bulk;'

