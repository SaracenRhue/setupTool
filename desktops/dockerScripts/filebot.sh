#!/bin/bash

sudo docker run -d \
--name=filebot \
-p 5800:5800 \
-v /docker/appdata/filebot:/config:rw \
-v $HOME:/storage:rw \
jlesage/filebot