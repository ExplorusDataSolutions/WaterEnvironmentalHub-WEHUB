#!/bin/bash

cp init.d/* /etc/init.d

chkconfig --add postgres
chkconfig --add wehub-enginey
chkconfig --add wehub-catalogue
chkconfig --add wehub-search
chkconfig --add nginx
