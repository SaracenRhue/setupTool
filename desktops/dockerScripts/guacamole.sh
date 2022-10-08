#!/bin/bash

docker run -d -v /docker/appdata/guacamole:/config -p 8067:8080 jasonbean/guacamol