#!/bin/bash

#service redis-server start

ntopng -r redis -i tcp://nprobe:5556 --disable-login=1 --dns-mode=1 -m "192.168.0.0/16,10.0.0.0/8" -F 'es;ntopng;ntopng-%Y.%m.%d;http://elasticsearch:9200/_bulk;'
